class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:new]
  end

  def dico?
    response = URI.parse("https://wagon-dictionary.herokuapp.com/#{@word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def included?
    @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) }
  end
end
