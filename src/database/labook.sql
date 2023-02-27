-- Active: 1677428891717@@127.0.0.1@3306

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

INSERT INTO users (id, name, email, password, role)
VALUES
	("u001", "Fulano", "fulano@email.com", "fulano123", "NORMAL"),
	("u002", "Beltrana", "beltrana@email.com", "beltrana00", "NORMAL"),
	("u003", "Astrodev", "astrodev@email.com", "astrodev99", "ADMIN");

    

CREATE TABLE posts (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  creator_id TEXT NOT NULL,
  content TEXT NOT NULL,
  likes INTEGER DEFAULT(0) NOT NULL,
  dislikes INTEGER DEFAULT(0) NOT NULL,
  created_at TEXT DEFAULT (DATETIME()) NOT NULL,
  updated_at TEXT DEFAULT (DATETIME()) NOT NULL,
   Foreign Key (creator_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE
    likes_dislikes (
        user_id TEXT NOT NULL,
        post_id TEXT NOT NULL,
        like INTEGER NOT NULL,
        Foreign Key (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
        Foreign Key (post_id) REFERENCES posts(id) ON DELETE CASCADE ON UPDATE CASCADE
    );

SELECT * FROM users;