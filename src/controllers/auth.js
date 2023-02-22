import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { connectionDB } from '../database/db.js';

export async function signUp(req,res,next){
    const {name, email, password} = res.locals.signup;
    const encryptedPassword = bcrypt.hashSync(password, 10);

    try{
        await connectionDB.query("INSERT INTO users(name, email, password) VALUES($1, $2, $3)",[name, email, encryptedPassword]);

        res.sendStatus(201);
    }catch(err){
        res.status(500).send(err.message);
    }
}

export async function signIn(req,res,next){
    const id = res.locals.id;

    const {email,password} = req.body;
    const {rows:users} = await connectionDB.query("SELECT * FROM users WHERE email=$1",[email]);
    const [user] = users;
    if(!user){
        return res.sendStatus(401);
    } 
 
    try{
        var token = jwt.sign({id}, process.env.SECRET , {
            expiresIn: 1800
        });
        if(bcrypt.compareSync(password, user.password)){
            res.status(200).send(token);
            await connectionDB.query('INSERT INTO sessions ("userId") VALUES($1)',[user.id])
        } else {
            return res.sendStatus(401);
        }
        
    }catch(err){
        console.log(err);
    }
}