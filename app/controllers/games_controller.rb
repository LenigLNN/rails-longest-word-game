require 'open-uri'
require 'json'

# The controller of the game
class GamesController < ApplicationController
  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def included?(guess, grid)
    guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end

  def new
    @array = ('A'..'Z').to_a
    @letters = []
    10.times do
      @letters << @array[rand(26)]
    end
  end

  def score
    @word = params[:word]
    @letters = params[:letters].chars
    if included?(@word, @letters)
      if english_word?(@word)
        @result = "Congratulations! #{@word} is a valid English word!"
      else
        @result = "Sorry but '#{@word}'
          does not seem to be a valid English word...!"
      end
    else
      @result = "Sorry but '#{@word}' can't
        be built out of '#{@letters.join(', ')}'."
    end
  end
end
