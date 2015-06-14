module Codebreaker
  class Game
     
    def initialize
      @secret_code = 4.times.map{rand(1..6)}
      @attempts = 10
    end

    def guess(player_code)
    	@attempts -= 1  unless @attempts <= 0
    	attempt_code = player_code.each_char.map{ |i| i.to_i }
       	answer = {}
    	
    	#get "+"
    	
    	for i in 0..3
    		if @secret_code.at(i) == attempt_code.at(i)
    			answer[i] = "+"
    		end
     	end
    	
    	#get "-"
    	
    	secret = Hash[(0...@secret_code.size).zip(@secret_code)]
    	attempt = Hash[(0...attempt_code.size).zip(attempt_code)]

    	attempt.delete_if do |key,value|
    		key = answer[key]
    	end

    	secret.delete_if do |key,value|
    		key = answer[key]
    	end

    	secret.each_value do |value|
    		if attempt.has_value?(value)
    			i += 10
    			answer[i] = "-"
    		end
    	end
    	
    	result = ""
    	
    	answer.each_value do |value|
    		result << value
    	end

    	return result


    end
  end
end