import { userSchema } from "../models/users.models.js";

export async function validateSchemaUser(req,res,next){
    const {error} = userSchema.validate(req.body, {abortEarly: false});
    if(error){
        const errors = error.details.map((detail) => detail.message);
        return res.status(409).send({errors});
    }
    next();
}