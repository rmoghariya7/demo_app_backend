import express from "express";
import authRouter from "./authRouter.js";
import { isAuthenticated } from "../middlewares/isAuthenticated.js";
import { blogRouter } from "./blogRouter.js";
const router = express.Router();

router.use("/api/auth", authRouter);
router.use("/api/blog", isAuthenticated, blogRouter);

export default router;
