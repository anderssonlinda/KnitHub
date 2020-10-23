def run_sql sql, params=[]
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'knitting_app'})
    results = db.exec_params(sql, params)
    db.close 
    results
end

def create_user username, email, password_digest
    run_sql("INSERT INTO users (username, email, password_digest) VALUES( $1, $2, $3);", [username, email, password_digest])
end

def find_user_by_id id 
    results = run_sql("SELECT * FROM users WHERE id = $1;", [id])
    results
end

def find_user_by_email email
    results = run_sql("SELECT * FROM users WHERE email = $1;", [email])
    results[0]
end

def all_patterns 
    results = run_sql("SELECT * FROM patterns;")
    results
end

def find_patterns_by_category category 
    results = run_sql("SELECT * FROM patterns WHERE category = $1;", [category])
    results
end

def find_pattern_by_id id 
    results = run_sql("SELECT * FROM patterns WHERE id = $1;", [id])
    results[0]
end

def get_saved_patterns user_id 
    results = run_sql("SELECT saved_patterns FROM users WHERE id = $1;", [user_id])
    results[0]["saved_patterns"]
end

def save_pattern patterns, user_id
    results = run_sql("UPDATE users SET saved_patterns = $1 WHERE id = $2;", [patterns, user_id])
end