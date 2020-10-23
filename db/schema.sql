
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

INSERT INTO patterns (display_image_url, chart_url, category) VALUES('https://www.knittingkingdom.com/wp-content/uploads/2020/05/Braid-Cable-Knitting-Stitch.jpg', 'https://www.knittingkingdom.com/wp-content/uploads/2020/05/ijvfio-482x1024.jpg', 'cables');

alter table users add column saved_patterns TEXT;

INSERT INTO users (saved_patterns) VALUES('1') where id = 1;

UPDATE users SET saved_patterns = '1' WHERE id =1;