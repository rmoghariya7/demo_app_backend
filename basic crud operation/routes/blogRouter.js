import express from "express";
import {
  createBlog,
  getAllBlogs,
  getMyBlogs,
  likeBlog,
} from "../controllers/blogController.js";

const blogRouter = express.Router();

blogRouter.route("/").get(async (req, res, next) => {
  try {
    const result = await getAllBlogs();
    res.status(200).json({ message: "blogs fetched successfully", result });
  } catch (error) {
    next(error);
  }
});

blogRouter.route("/myBlogs").get(async (req, res, next) => {
  try {
    const result = await getMyBlogs(req);
    res.status(200).json({ message: "blogs fetched successfully", result });
  } catch (error) {
    next(error);
  }
});

blogRouter.route("/write").post(async (req, res, next) => {
  try {
    const result = await createBlog(req);
    console.log("result", result);
    res
      .status(200)
      .json({ message: "Blog created successfully", data: result });
  } catch (error) {
    next(error);
  }
});

blogRouter.route("/like").put(async (req, res, next) => {
  try {
    const { blogId } = req.body;
    if (!blogId) {
      throw new Error("Blog id is required");
    }
    // Logic to like a blog
    const blogLiked = await likeBlog(req);
    console.log("blogLiked", blogLiked);
    res.status(200).json({ message: "Blog liked successfully" });
  } catch (error) {
    next(error);
  }
});

export { blogRouter };
