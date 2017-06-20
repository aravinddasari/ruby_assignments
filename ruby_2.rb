puts "Enter string"
str = gets.chomp

final_sum = 0

sample = ''       
ignore = false   #for -ve numbers 
count = 0        #for total no of +ve numbers
str.split("").each do |c|
    if c == '-'
    	ignore = true	
    elsif c.ord >= 48 && c.ord <= 57 && ignore == false
    	final_sum = final_sum + c.to_i
    	count = count + 1
    else 
    	ignore = false
    	sample =''
    end
end
final_sum = final_sum + sample.to_i
puts "average sum of +ve numbers is" 
puts (final_sum.to_f/count).to_f
