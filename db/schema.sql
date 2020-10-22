
CREATE TABLE patterns (
    id SERIAL PRIMARY KEY,  
    display_image_url TEXT, 
    chart_url TEXT,
    category VARCHAR(10) 
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,  
    username VARCHAR(20), 
    email TEXT,
    password_digest TEXT
);

INSERT INTO patterns (display_image_url, chart_url, category) VALUES('https://www.dummies.com/wp-content/uploads/108232.image0.jpg', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTY8z8c0yOAEJ8KN_ro_yl31RWxqt7Z6smYGA&usqp=CAU', 'textures');

alter table users add column saved_patterns TEXT;

INSERT INTO users (saved_patterns) VALUES('1') where id = 1;

UPDATE users SET saved_patterns = '1' WHERE id =1;