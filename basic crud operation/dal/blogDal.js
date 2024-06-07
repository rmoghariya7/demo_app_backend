const addBlog = async (dbClient, title, content, writtenBy) => {
  const sqlStatement = `INSERT INTO "Blogs" (title, content,written_by) VALUES ($1, $2,$3) RETURNING *`;
  const { rows } = await dbClient.query(sqlStatement, [
    title,
    content,
    writtenBy,
  ]);
  console.log("rows", rows);
  return rows[0];
};

const getBlogsByUserId = async (dbClient, userId) => {
  const sqlStatement = `SELECT * FROM "Blogs" WHERE written_by = $1`;
  const { rows } = await dbClient.query(sqlStatement, [userId]);
  return rows;
};
const getBlogs = async (dbClient) => {
  const sqlStatement = `SELECT * FROM "Blogs"`;
  const { rows } = await dbClient.query(sqlStatement);
  return rows;
};

const likeBlogById = async (dbClient, blogId, userId) => {
  const sqlStatement = `insert into blog_likes (blog_id, user_id) values ($1, $2)`;
  try {
    return await dbClient.query(sqlStatement, [blogId, userId]);
  } catch (error) {
    throw new Error(error);
  }
};

export { likeBlogById, addBlog, getBlogs, getBlogsByUserId };
