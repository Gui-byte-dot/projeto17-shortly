import { nanoid } from "nanoid";
import { connectionDB } from "../database/db.js";


export async function postUrl(req,res){
    const body = req.body;
    try{
        const shortUrl = nanoid();
        await connectionDB.query('INSERT INTO urls(url, "shortUrl", "userId") VALUES ($1, $2, $3)',[url, shortUrl, userId]);
        res.send(shortUrl);
    }catch(err){
        res.sendStatus(422);
        console.log(err);
    }
}