# frozen_string_literal: true

require 'httparty'

# games controller handles games logic
class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    api_url = 'https://wagon-dictionary.herokuapp.com/'

    @word = params[:user_input]
    @letters_options = params[:letters_options].split(' ')

    checked_words = @word.split('').all? do |char|
      @letters_options.include?(char)
    end
    response = HTTParty.get(api_url + @word)
    @valid_word = response['found'] && checked_words
  end
end
