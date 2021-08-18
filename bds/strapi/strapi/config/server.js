module.exports = ({ env }) => ({
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  url: env('STRAPI_URL', '127.0.0.1'),
  admin: {
    auth: {
      secret: env('ADMIN_JWT_SECRET', '14631ac14228aedd4b2fdfee7e19c731'),
    },
  },
});
