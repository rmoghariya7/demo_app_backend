import {
  addBlog,
  getBlogs,
  getBlogsByUserId,
  likeBlogById,
} from "../dal/blogDal.js";
import pool from "../utils/dbConnection.js";

const createBlog = async (req) => {
  const { title, content } = req.body;
  if (!title || !content) {
    throw new Error("Title and content are required");
  }
  const dbClient = await pool.connect();
  try {
    return await addBlog(dbClient, title, content, req.user.id);
  } catch (error) {
    throw new Error(error);
  } finally {
    dbClient.release();
  }
};

const getMyBlogs = async (req) => {
  const dbClient = await pool.connect();
  try {
    const blogs = await getBlogsByUserId(dbClient, req.user.id);
    return blogs;
  } catch (error) {
    throw new Error(error);
  } finally {
    dbClient.release();
  }
};

const getAllBlogs = async () => {
  const dbClient = await pool.connect();
  try {
    const blogs = await getBlogs(dbClient);
    return blogs;
  } catch (error) {
    throw new Error(error);
  } finally {
    dbClient.release();
  }
};

const likeBlog = async (req) => {
  const { blogId } = req.body;
  if (!blogId) {
    throw new Error("Blog id is required");
  }
  const dbClient = await pool.connect();
  try {
    return await likeBlogById(dbClient, blogId, req.user.id);
  } catch (error) {
    throw new Error(error);
  } finally {
    dbClient.release();
  }
};

export { createBlog, getAllBlogs, getMyBlogs, likeBlog };
