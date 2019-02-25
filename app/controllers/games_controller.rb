require 'json'
require 'open-uri'
class GamesController < ApplicationController
  VOWELS = ['A', 'E', 'I', 'O', 'U', 'Y']

  def new
    @letters = []
    7.times { @letters << ('A'..'Z').to_a.sample }
    3.times { @letters << VOWELS.sample }
    @letters.shuffle!
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @word_check = open(url).read
    @result = JSON.parse(@word_check)
    if @result['found'] == false
      @score = "Sorry, #{@word} is not an english word"
    else
      # if checker?
      #   @score = "Congratulations!#{@word} is actually a real word"
      # else
      #   @score = "Sorry #{@word} is not in the grid"
      end
    end
  end
# end

  # def checker?
  #   checked = true
  #   @word.split("").each do |letter|
  #     if @letters.include?(letter.upcase)
  #       @letters.delete_at(@letters.index(letter.upcase))
  #     else
  #       checked = false
  #     end
  #   end
  #   checked
  # end
