import { Router } from "express";
import { validateSchemaUser } from "../middlewares/signup.middleware.js";
import { signUp } from "../controllers/auth.js";

const authRoutes = Router();
authRoutes.post("/signup", validateSchemaUser, signUp);

export default authRoutes;


