import jwt from "jsonwebtoken";
import ErrorResponse from "../utils/ErrorHandler.js";
import { checkEmailExists } from "../dal/auth.dal.js";
import pool from "../utils/dbConnection.js";

const isAuthenticated = async (req, res, next) => {
  const dbClient = await pool.connect();
  try {
    const token = req.cookies.token;
    if (!token) {
      next(new ErrorResponse(401, "Not authorized"));
    }
    const decoded = jwt.verify(token, process.env.SECRET_KEY);
    if (await checkEmailExists(dbClient, decoded.email)) {
      dbClient.release();
      req.user = decoded;
      next();
    } else {
      dbClient.release();
      next(new ErrorResponse(401, "User not found"));
    }
  } catch (error) {
    dbClient.release();
    next(new ErrorResponse(401, error.name));
  }
};

export { isAuthenticated };
