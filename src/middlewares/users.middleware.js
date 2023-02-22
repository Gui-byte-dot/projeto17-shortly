import { urlSchema } from "../models/urls.models.js";
import jwt from "jsonwebtoken";
import { connectionDB } from "../database/db.js";

const secret = "meu-segredo";//esse segredo do JWT seria uma config


export async function validToken(req,res,next){
  
    const {authorization} = req.headers;
    if(!authorization){
        return res.sendStatus(401);
    }
    const token = authorization?.replace('Bearer ', '');
    
    jwt.verify(token, process.env.SECRET, function(err, decoded) {
      if (err) return res.status(401).json({ auth: false, message: 'Failed to authenticate token.' });
      
      // se tudo estiver ok, salva no request para uso posterior
      req.userId = decoded.id;
      next();
    });
}

export async function postMiddleware(req,res,next){
    const body = req.body;
    const {error} = urlSchema.validate(body, {abortEarly: false});
    if(error){
        return res.status(422).send(error.details[0].message);
    }
    next();
}

export async function getMiddleware(req,res,next){
  const {id} = req.params;
  const {rows:verifyId} = await connectionDB.query("SELECT * FROM urls WHERE id=$1",[id]);
  if(!verifyId[0]){
    return res.sendStatus(404);
  }
  res.locals.url = verifyId[0];
  next();
}

export async function getShortUrlMiddleware(req,res,next){
  const {shortUrl} = req.params;
  const {rows:verifyShort} = await connectionDB.query('SELECT * FROM urls WHERE "shortUrl"=$1',[shortUrl]);
  if(!verifyShort[0]){
    return res.sendStatus(404);
  }
  res.locals.body = verifyShort[0];
  next();

}


