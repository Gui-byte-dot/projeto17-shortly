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

export async function deleteUrl(req,res){
    const {id} = req.params;
    try{
        const {rows:verifyDelId} = await connectionDB.query('SELECT * FROM urls WHERE id=$1',[id]);
        const [verifyId] = verifyDelId;

        const {rows:verifyUrl} = await connectionDB.query('SELECT * FROM sessions ORDER BY id DESC LIMIT 1');
        const [verifyUrlId] = verifyUrl;

        if(!verifyDelId){
            return res.status(404);
        }

        if(verifyId.userId !== verifyUrlId.userId){
            return res.status(401).send("A url não pertence ao usuário");
        }

        await connectionDB.query('DELETE FROM urls WHERE id=$1',[id]);
        res.sendStatus(204);


        console.log(verifyId.userId);
        console.log(verifyUrlId.userId);

    }catch(err){
        console.log(err);
        return res.sendStatus(404);
    }
}

export async function findAllShorts(req,res){
    const {rows: userShort} = await connectionDB.query('SELECT * FROM sessions ORDER BY id DESC LIMIT 1');
    const [userShorts] = userShort;
    const userId = userShorts.userId;


    
    // const userId = userShorts.userId;
    try{
        const {rows:allShortsUrls} = await connectionDB.query(`
            SELECT 
            users.id as id, 
            users.name as name, 
            SUM(visits) as "visitCount", 
            json_agg(
                json_build_object(
                    'id', urls.id,
                    'shortUrl', urls."shortUrl",
                    'url', urls.url,
                    'visitCount', urls.visits
                )
            ) as "shortenedUrls"
            FROM urls
            JOIN users
            ON urls."userId" = users.id
            WHERE users.id = $1
            GROUP BY users.id
        `, [userId]);
        res.status(200).send(allShortsUrls);

    }catch(err){
        console.log(userShorts);
        return res.sendStatus(500);
    }
}

export async function getRankings(req,res){
    try{
        const {rows: rankings} = 
        await connectionDB.query(`
        SELECT 
        users.id AS id,
        users.name AS name,
        COUNT(urls) AS "linksCount",
        COALESCE(SUM(visits), 0) as "visitCount"
        FROM users
        LEFT JOIN urls
        ON users.id = urls."userId"
        GROUP BY users.id
        ORDER BY "visitCount" DESC
        LIMIT 10
    `);
    res.status(200).send(rankings);
    }catch(err){
        console.log(err);
        res.status(500).send(err.message);
    }
    
}