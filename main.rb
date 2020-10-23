require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry' if development?
require 'bcrypt'
require_relative 'db/data_access'
enable :sessions

def logged_in?
  if session[:user_id]
    true
  else
    false
  end
end

def current_user 
  find_user_by_id(session[:user_id])[0]
end

get '/' do
  patterns = all_patterns
  erb :index, locals: {patterns: patterns}
end

get '/patterns/details/:id' do
  pattern = find_pattern_by_id(params[:id])
  erb :pattern_details, locals: {pattern: pattern}
end

get '/patterns/:category' do
  if params[:category] == 'all'
    patterns = all_patterns
    erb :index, locals: {patterns: patterns}
  else 
    patterns = find_patterns_by_category(params['category'])
    erb :index, locals: {patterns: patterns}
  end
end

patch '/pattern/save/:pattern_id' do 
  redirect '/login' unless logged_in?

  patterns = get_saved_patterns(current_user['id'])
  if patterns == nil
    patterns = "#{params[:pattern_id]}"
  else 
    patterns += ",#{params[:pattern_id]}"
  end

  save_pattern(patterns, current_user['id'])
  redirect "/patterns/details/#{params[:pattern_id]}"
end 

patch '/pattern/unsave/:pattern_id' do 
  redirect '/login' unless logged_in?

  patterns = get_saved_patterns(current_user['id'])
  patterns = patterns.split(',')
  patterns.delete("#{params[:pattern_id]}")  
  patterns = patterns.join(',')

  save_pattern(patterns, current_user['id'])
  redirect "/patterns/details/#{params[:pattern_id]}"

end

get '/user/saved_patterns' do
  redirect '/login' unless logged_in?

  patterns = get_saved_patterns(current_user['id'])
  
  erb :saved_patterns, locals: {patterns: patterns, all_patterns: all_patterns}
end

get '/user/:action' do 
  if params[:action] == 'signup'
    erb :signup
  elsif params[:action] == 'signin'
    erb :signin
  end
end

post '/user/signup' do
  password_digest = BCrypt::Password.create(params['password'])
  create_user(params['username'], params['email'], password_digest)

  user = find_user_by_email(params['email'])
  session[:user_id] = user["id"]
  redirect '/'
end

post '/user/signin' do 
  user = find_user_by_email(params['email'])
  if BCrypt::Password.new(user['password_digest']) == params['password']
    session[:user_id] = user["id"]
    redirect '/'
  else
    erb :signin
  end
end

delete '/logout' do
  session[:user_id] = nil 
  redirect '/'
end
