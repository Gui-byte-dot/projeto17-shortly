import { urlSchema } from "../models/urls.models.js";
import jwt from "jsonwebtoken";
import { connectionDB } from "../database/db.js";

export async function validToken(req,res,next){
    const {authorization} = req.headers;
    if(!authorization){
        return res.sendStatus(401);
    }
    const token = authorization?.replace('Bearer', '');
    jwt.verify(token, secret, function(err,decoded) {
        if(err){
            return res.status(500).send({auth: false, message: 'Token Inválido'});
        }
        req.userId = decoded.id;
        next();
    });
}

export async function postMiddleware(req,res,next){
    const body = req.body;
    const {error} = urlSchema.validate(body, {abortEarly: false});
    if(error){
        return res.status(422).send(error.details);
    }
    next();
}


