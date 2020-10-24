
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
CREATE TABLE projects (
    id SERIAL PRIMARY KEY,  
    pattern_id INTEGER, 
    user_id INTEGER,
    image_url TEXT,
    ravelry_url TEXT
);

INSERT INTO patterns (display_image_url, chart_url, category) VALUES('https://www.knittingkingdom.com/wp-content/uploads/2020/05/Braid-Cable-Knitting-Stitch.jpg', 'https://www.knittingkingdom.com/wp-content/uploads/2020/05/ijvfio-482x1024.jpg', 'cables');

INSERT INTO projects (pattern_id, user_id, image_url, ravelry_url) VALUES($1, $2, $3, $4); 

alter table users add column saved_patterns TEXT;

INSERT INTO users (saved_patterns) VALUES('1') where id = 1;

UPDATE users SET saved_patterns = '1' WHERE id =1;