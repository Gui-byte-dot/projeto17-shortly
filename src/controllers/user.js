import { nanoid } from "nanoid";
import { connectionDB } from "../database/db.js";


export async function postUrl(req,res){
    const {url,shortUrl}= req.body;
    const userShortly = await connectionDB.query('SELECT * FROM sessions ORDER BY id DESC LIMIT 1');
    const userId = (userShortly.rows[0].userId);
    try{
        const shortUrl = nanoid();
        await connectionDB.query('INSERT INTO urls(url, "shortUrl", "userId") VALUES ($1, $2, $3)',[url, shortUrl, userId]);


        const idShortly = await connectionDB.query('SELECT * FROM urls WHERE "shortUrl"=$1',[shortUrl]);
        const idUrl = (idShortly.rows.id);



        res.status(201).send({id:idUrl, shortUrl:shortUrl});
    }catch(err){
        res.sendStatus(422);
        console.log(err);
    }
}

export async function getUrl(req,res){
    const {id,url,shortUrl} = res.locals.url;
    try{
        const urlData = {
            id,
            url,
            shortUrl
        };
        console.log(url);
        res.send(urlData);
    }catch(err){
        res.sendStatus(500);
        console.log(err);
    }

}

export async function updateUrl(req,res){
    const body = res.locals.body;
    try{
        await connectionDB.query('UPDATE urls SET visits=$1 WHERE "shortUrl"=$2',[body.visits + 1, body.shortUrl]);
        res.status(200).redirect(body.url);
    }catch(err){
        res.status(500).send(console.error);

    }
}

