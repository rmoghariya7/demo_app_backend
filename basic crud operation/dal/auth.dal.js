const checkEmailExists = async (dbClient, email) => {
  const { rowCount } = await dbClient.query(
    `SELECT * FROM "Users" WHERE email = $1`,
    [email]
  );

  return rowCount ? true : false;
};

const addUser = async (dbClient, email, password) => {
  const sqlStatement = `INSERT INTO "Users" (email, password) VALUES ($1, $2) RETURNING *`;
  const { rows } = await dbClient.query(sqlStatement, [email, password]);
  return rows[0];
};

const getUserByEmail = async (dbClient, email) => {
  const { rows } = await dbClient.query(
    `SELECT * FROM "Users" WHERE email = $1`,
    [email]
  );
  return rows[0];
};
export { checkEmailExists, addUser, getUserByEmail };
