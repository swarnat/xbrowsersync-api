# --------- Base Image for build ---------
FROM node:22-slim AS base

WORKDIR /usr/src/app

# Copy package.json first to leverage Docker cache
COPY package*.json ./

# Install build dependencies for node-gyp
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 make g++ && \
    npm install && \
    apt-get remove -y python3 make g++ && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

COPY . .

# --------- Builder Stage ---------
FROM base AS builder
WORKDIR /usr/src/app

# Build the project
RUN npm run build

# --------- Production Stage ---------
FROM node:22-slim AS production
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json
COPY package*.json ./

# Install only production dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 make g++ && \
    npm install --omit=dev && \
    apt-get remove -y python3 make g++ && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Copy built files from builder stage
COPY --from=builder /usr/src/app/dist ./

EXPOSE 8080
ENTRYPOINT ["node", "./api.js"]

