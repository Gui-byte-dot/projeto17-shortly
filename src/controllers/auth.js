import bcrypt from 'bcrypt';
import { connectionDB } from '../database/db.js';

export async function signUp(req,res,next){
    const {name, email, password} = req.body;
    const encryptedPassword = bcrypt.hashSync(password, 10);

    try{
        await connectionDB.query("INSERT INTO users(name, email, password) VALUES($1, $2, $3)",[name, email, encryptedPassword]);
        res.sendStatus(201);
    }catch(err){
        res.status(500).send(err.message);
        console.log(err);
    }
}