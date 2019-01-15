require 'sinatra'

get '/' do
    erb :index
  end
   
get '/array' do
    erb :arraymaker
end

get '/hangman' do
    erb :hangman
end

$testArray = []
$randomWord
$wordLength
$wordDashes = []

post '/submit' do
  @phrase = params[:phrase]  # get value from form field
  $testArray.push(@phrase)   # push into array
  erb :arraymaker
end

post '/pick' do
  $randomWord = $testArray.sample  # get random index from array 
  $wordLength = $randomWord.length  # get length of word
  $wordLength.times do      # loop through word and give _ per letter
    $wordDashes.push("_")
  end
  erb :arraymaker
end

post '/clear' do
  $testArray = []  # empty array
  erb :arraymaker
end


