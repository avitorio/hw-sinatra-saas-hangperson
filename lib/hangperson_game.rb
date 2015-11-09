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
    if letter == nil || letter.match(/^[[:alpha:]]+$/) == nil then raise ArgumentError, 'Argument is invalid' end
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
    
  def word_with_guesses
    @word_with_guesses = @word.dup;
    index = 0
    @word_with_guesses.each_char { |char|
      if /#{char}/.match(@guesses) == nil then
        @word_with_guesses[index] = '-'
      end
      index += 1
    }
    return @word_with_guesses
    
  end
  
  def check_win_or_lose
    if word_with_guesses == @word then 
      return :win
    elsif @guesses.length + @wrong_guesses.length >= 7 then
      return :lose
    else
      return :play
    end
  end
    
          

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
