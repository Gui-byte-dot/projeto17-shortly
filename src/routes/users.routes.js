import { Router } from "express";
import { validToken,getMiddleware, postMiddleware, getShortUrlMiddleware } from "../middlewares/users.middleware.js";
import { postUrl,getUrl, updateUrl,deleteUrl } from "../controllers/user.js";

const userRoutes = Router();
userRoutes.post("/urls/shorten",validToken,postMiddleware,postUrl);
userRoutes.get("/urls/:id",getMiddleware, getUrl);
userRoutes.get("/urls/open/:shortUrl",getShortUrlMiddleware, updateUrl);
userRoutes.post("/urls/:id",validToken,deleteUrl)

export default userRoutes;