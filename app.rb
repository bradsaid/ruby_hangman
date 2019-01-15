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
$guessedLetters = []
$guess

post '/submit' do
  @phrase = params[:phrase]  # get value from form field
  $testArray.push(@phrase)   # push into array
  erb :arraymaker
end

post '/pick' do
  $wordDashes = []                  # empty dash array
  $guessedLetters = []              # empty guessed letters array 
  $randomWord = $testArray.sample   # get random index from array 
  $wordLength = $randomWord.length  # get length of word
  $wordLength.times do              # loop through word and give _ per letter
    $wordDashes.push("_")
  end
  erb :arraymaker
end

post '/guess' do
  @letter = params[:letter]
  $guessedLetters.push(@letter)
  if $randomWord.include? @letter   
    $guess = $randomWord.index(@letter)  # now need to swap the _ with the @letter
    $wordDashes[$guess] = @letter
    else
    $guess = "no"
  end
  erb :hangman
end

post '/clear' do
  $testArray = []  # empty array
  erb :arraymaker
end


