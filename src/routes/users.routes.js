import { Router } from "express";
import { validToken,getMiddleware, postMiddleware, getShortUrlMiddleware} from "../middlewares/users.middleware.js";
import { postUrl,getUrl, updateUrl,deleteUrl,findAllShorts } from "../controllers/user.js";

const userRoutes = Router();
userRoutes.post("/urls/shorten",validToken,postMiddleware,postUrl);
userRoutes.get("/urls/:id",getMiddleware, getUrl);
userRoutes.get("/urls/open/:shortUrl",getShortUrlMiddleware, updateUrl);
userRoutes.post("/urls/:id",validToken,deleteUrl);
userRoutes.get("/users/me",validToken,findAllShorts)

export default userRoutes;