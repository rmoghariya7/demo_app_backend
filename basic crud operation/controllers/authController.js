import pool from "../utils/dbConnection.js";
import ErrorResponse from "../utils/ErrorHandler.js";
import { addUser, checkEmailExists, getUserByEmail } from "../dal/auth.dal.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import config from "../config.js";

const createUser = async (email, password) => {
  const dbClient = await pool.connect();
  try {
    if (!email || !password) {
      new ErrorResponse(400, "Please provide credentials");
    }

    // check if user already exists
    const userExists = await checkEmailExists(dbClient, email);

    if (userExists) {
      throw new ErrorResponse(400, "User already exists");
    }

    return await addUser(dbClient, email, password);
  } catch (error) {
    throw new ErrorResponse(500, error.message);
  } finally {
    dbClient.release();
  }
};

const loginUser = async (email, password) => {
  const dbClient = await pool.connect();
  try {
    if (!email || !password) {
      throw new ErrorResponse(400, "Please provide credentials");
    }
    // check if user already exists
    const user = await getUserByEmail(dbClient, email);

    if (!user) {
      throw new ErrorResponse(400, "User does not exist");
    }

    const matchPasswords = await bcrypt.compare(password, user.password);

    if (!matchPasswords) {
      throw new ErrorResponse(400, "Invalid credentials");
    }

    const jwtToken = jwt.sign(
      { email: user.email, id: user.id },
      config.secret,
      {
        expiresIn: "1h",
      }
    );

    return { ...user, token: jwtToken };
  } catch (error) {
    throw new ErrorResponse(500, error.message);
  } finally {
    dbClient.release();
  }
};

export { createUser, loginUser };
