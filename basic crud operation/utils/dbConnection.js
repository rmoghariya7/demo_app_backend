import pg from "pg";
import config from "../config.js";

const pool = new pg.Pool({
  user: config.db_user,
  password: config.db_password,
  database: config.db_name,
  host: config.db_host,
  port: config.db_port,
});

export default pool;
