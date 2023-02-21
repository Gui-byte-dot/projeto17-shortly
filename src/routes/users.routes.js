import { Router } from "express";
import { validToken, postMiddleware } from "../middlewares/users.middleware.js";
import { postUrl } from "../controllers/user.js";

const userRoutes = Router();
userRoutes.post("/urls/shorten",validToken,postMiddleware,postUrl);

export default userRoutes;