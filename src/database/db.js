import pg from 'pg';
import dotenv from 'dotenv';

dotenv.config();

export const connectionDB = new Pool ({
    connectionString: process.env.DATABASE_URL,
})
