class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  
  attr_accessor(:word)
  attr_accessor(:guesses)
  attr_accessor(:wrong_guesses)

  def guess(letter)
    letter.downcase!
    if /#{letter}/.match(@word) != nil then
      if /#{letter}/.match(@guesses) == nil then
        @guesses << letter
        return true
      else
        return false
      end
    else
      if /#{letter}/.match(@wrong_guesses) == nil then
        @wrong_guesses << letter
        return true
      else
        return false
      end
    end
  end
    

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
