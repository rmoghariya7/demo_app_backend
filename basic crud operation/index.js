import express from "express";
import "dotenv/config";
import config from "./config.js";
import cookieParser from "cookie-parser";
import router from "./routes/index.js";
import { isAuthenticated } from "./middlewares/isAuthenticated.js";
const { port } = config;

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());

app.use("/v1", router);

// error handling middlewares
app.use((err, req, res, next) => {
  res.status(err.statusCode).send(err.message);
});
app.listen(port, () => {
  console.log("Server is running on port 3000");
});
