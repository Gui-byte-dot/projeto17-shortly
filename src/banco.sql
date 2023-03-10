CREATE TABLE "users" (
    "id" SERIAL PRIMARY KEY,
    "username" TEXT NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt"  TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()  
);


CREATE TABLE "urls" (
    "id" SERIAL PRIMARY KEY,
    "url" TEXT NOT NULL,
    "shortUrl" TEXT UNIQUE NOT NULL,
    "visits" INTEGER NOT NULL DEFAULT(0),
    "userId" INTEGER REFERENCES users(id),
    "createdAt"  TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE TABLE "sessions" (
    "id" SERIAL PRIMARY KEY,
    "userId" INTEGER REFERENCES users(id),
);