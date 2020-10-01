-- PRAGMA foreign_keys = ON;
DROP TABLE if exists question_likes;
DROP TABLE if exists replies;
DROP TABLE if exists question_follows;
DROP TABLE if exists questions;
DROP TABLE if exists users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL, 
    
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,

    FOREIGN KEY (parent_reply_id ) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
    users(fname, lname)
VALUES
    ('Donald','Trump'),
    ('Joe','Biden');


INSERT INTO
    questions(title, body, author_id)
VALUES
    ('Economy','Who knows what''s going on...', (SELECT id FROM users WHERE fname = 'Donald' AND lname = 'Trump')),
    ('Corona','What is that?', (SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Biden'));


INSERT INTO
    question_follows (user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Donald' AND lname = 'Trump'), (SELECT id FROM questions WHERE title = 'Economy')),
    ((SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Biden'), (SELECT id FROM questions WHERE title = 'Corona'));
   

INSERT INTO
    replies (body, user_id, question_id, parent_reply_id)
VALUES
    ('What do you mean who knows?', (SELECT id FROM users WHERE fname = 'Joe' AND lname = 'Biden'), (SELECT id FROM questions WHERE title = 'Economy'), NULL);


INSERT INTO
    replies (body, user_id, question_id, parent_reply_id)
VALUES
    ('What?????', (SELECT id FROM users WHERE fname = 'Donald' AND lname = 'Trump'),(SELECT id FROM questions WHERE title = 'Economy'), (SELECT id FROM replies WHERE body = 'What do you mean who knows?'));


INSERT INTO
    replies (body, user_id, question_id, parent_reply_id)
VALUES
    ('Exactly!', (SELECT id FROM users WHERE fname = 'Donald' AND lname = 'Trump'), (SELECT id FROM questions WHERE title = 'Economy'), (SELECT id FROM replies WHERE body = 'What?????'));


INSERT INTO
    question_likes(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE fname = 'Donald' AND lname = 'Trump'), (SELECT id FROM questions WHERE title = 'Economy'));
