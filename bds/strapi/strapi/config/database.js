module.exports = ({ env }) => ({
  defaultConnection: 'default',
  connections: {
    default: {
      connector: 'bookshelf',
      settings: {
        client: 'mysql',
        filename: "/var/mysql/data.db",
      },
      options: {},
    },
  },
});
