import express from "express";
import { createUser, loginUser } from "../controllers/authController.js";
import bcrypt from "bcrypt";
import config from "../config.js";
const authRouter = express.Router();

authRouter.route("/register").post(async (req, res, next) => {
  console.log("req", req.cookies);
  try {
    const { email, password } = req.body;
    console.log("email, password", email, password);
    const hashedPassword = await bcrypt.hash(password, config.salt_rounds);
    await createUser(email, hashedPassword);
    res.status(200).json({ message: "User registered successfully" });
  } catch (error) {
    next(error);
  }
});

authRouter.route("/login").post(async (req, res, next) => {
  try {
    const { email, password } = req.body;
    const user = await loginUser(email, password);
    res
      .status(200)
      .cookie("token", user.token, { httpOnly: true })
      .json({ message: "User loggedIn successfully", token: user.token });
  } catch (error) {
    next(error);
  }
});

export default authRouter;
