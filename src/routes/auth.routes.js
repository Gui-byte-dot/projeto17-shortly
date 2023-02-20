import { Router } from "express";
import { validateSchemaUser } from "../middlewares/signup.middleware.js";
import { signInMiddleware } from "../middlewares/signin.middleware.js";
import { signIn, signUp } from "../controllers/auth.js";

const authRoutes = Router();
authRoutes.post("/signup", validateSchemaUser, signUp);
authRoutes.post("/signin", signInMiddleware, signIn);

export default authRoutes;


