TRUNCATE TABLE user_account RESTART IDENTITY;
TRUNCATE TABLE posts RESTART IDENTITY;


INSERT INTO user_account (email, username) VALUES ('anon@gmail.com', 'anon');
INSERT INTO posts (title, content, views, user_id) VALUES ('my test blog', 'my test content', 12, 1);
INSERT INTO posts (title, content, views, user_id) VALUES ('travel to Mexico', 'top beaches', 22, 1);
