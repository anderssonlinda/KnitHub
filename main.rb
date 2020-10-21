     
require 'sinatra'
require 'sinatra/reloader' if development?

def run_sql sql
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'knitting_app'})
  result = db.exec(sql)
  db.close 
  result[0]
end
get '/' do
  erb :index
end





