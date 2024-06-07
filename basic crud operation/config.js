const config = {
  port: process.env.PORT,
  secret: process.env.SECRET_KEY,
  db_user: process.env.DB_USER,
  db_password: process.env.DB_PASSWORD,
  db_name: process.env.DB_NAME,
  db_host: process.env.DB_HOST,
  db_port: process.env.DB_PORT,
  salt_rounds: 5,
};

export default config;
