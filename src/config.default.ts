export default {
  version: '1.1.13',
  allowedOrigins: [],
  dailyNewSyncsLimit: 3,
  db: {
    type: 'mysql',
    host: '127.0.0.1',
    name: 'xbrowsersync',
    port: 3306,
    ssl: false,
    username: '',
    password: '',
  },
  location: '',
  log: {
    file: {
      enabled: false,
      level: 'info',
      path: '/var/log/xBrowserSync/api.log',
      rotatedFilesToKeep: 5,
      rotationPeriod: '1d',
    },
    stdout: {
      enabled: true,
      level: 'info',
    },
  },
  maxSyncs: 5242,
  maxSyncSize: 512000,
  server: {
    behindProxy: false,
    host: '0.0.0.0',
    https: {
      certPath: '',
      enabled: false,
      keyPath: '',
    },
    port: 8080,
    relativePath: '/',
  },
  status: {
    allowNewSyncs: true,
    message: '',
    online: true,
  },
  tests: {
    db: 'xbrowsersynctest',
    port: 8081,
  },
  throttle: {
    maxRequests: 1000,
    timeWindow: 300000,
  },
};
