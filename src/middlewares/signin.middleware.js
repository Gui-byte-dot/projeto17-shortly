import { signInSchema } from "../models/users.models.js";

export async function signInMiddleware(req,res,next){
    const validation = signInSchema.validate(req.body, {abortEarly: true});
    if(validation.error){
        return res.status(422).send(validation.error.details);
    }
    next();
}