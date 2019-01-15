require 'sinatra'

get '/' do
    erb :index
  end
  
get '/about' do
    erb :about
end
  
get '/palindrome' do
    erb :palindrome
end

get '/hangman' do
    erb :hangman
end


post '/check' do
  @phrase = params[:phrase]
  erb :result
end
