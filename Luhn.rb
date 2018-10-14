class Luhn

	def self.checkValidity(n)
		count  = 0  #Count used to keep track of every second digit, and double accordingly
		sum = 0   #The sum of all numbers, then verified as per Luhn algorithm
		#Gets all individual digits of the number backwards, as needed. The number modulo 10 will always get the last
		#digit of that number. Dividing it by 10 and repeating the process gets each subsequent digit 
		#in that order
		while n > 0 
			digit = n % 10 #The individual digit
			n /= 10 
			#Doubling every even number, and if the result is > 9, add the 2 digits of the product, as per
			#Luhn algorithm
			if count % 2 != 0
				digit *= 2
				if digit > 9
					digit -= 9 #This is the same as adding 2 pproduct digits
				end
			end	
			sum += digit
			count += 1
		end
		if sum % 10 == 0 #The number is valid according to Luhn formula
			return true
		else
			return false #The number is invalid according to Luhn formula if the remainder if > 0
		end
	end
	#All same up until the doubling of every second digit, now doubling every odd digit instead of every even one
	#since the check digit is an unknown variable
	def self.getCheckDigit(n)
		count = 0
		sum = 0
		original_n = n
		while n > 0
			digit = n % 10
			n /= 10
			if count % 2 == 0 #doubling every odd number
				digit *= 2
				if digit > 9
					digit -= 9
				end
			end
			sum += digit
			count +=1
		end
		checkDigit = sum * 9 % 10 #getting the number which, when appended onto the original, yields 0 when n % 10
		output = String(original_n) << (String(checkDigit)) #appending the checkDigit onto the original n
		return output
	end

end
#To try out the methods via console, uncomment as necessary
#To test, type <ruby Luhn.rb #number> where #number is any integer, and without the "<,>"
#for example: ruby Luhn.rb 7992739871
puts Luhn.checkValidity(Integer(ARGV[0]))
#puts Luhn.getCheckDigit(Integer(ARGV[0]))