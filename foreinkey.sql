-- Active: 1710576437568@@127.0.0.1@5432@test_dbani
CREATE Table "suser"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
);
CREATE Table "post"(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "suser"(id)
);

INSERT INTO "suser"(username) VALUES('akash'),('batas'),('Jodo'),('kodu')

INSERT INTO "post" (title,user_id) VALUES ('enjoy the sunny dat',2),('After bath',3),('yes yes yes', 2), ('Oh yeag',44)


SELECT * FROM suser;
SELECT * FROM post