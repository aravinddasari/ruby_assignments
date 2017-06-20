

def calc(op1,op2,operator)
	
	if operator == '+'
	    return (op1 + op2)
	elsif operator == '-'
		return (op1 - op2)
	elsif operator == '*'
		return (op1 * op2)
	elsif operator == '/'
		return (op1 / op2)
	elsif operator == '**'
		return op1 ** op2
	else
		return 0
	end

end



def evaluate_exp(excel,row)

   if row.class.to_s == 'Fixnum'
      return row 
   end
   if row.class.to_s == 'String'
     first_column_val = row[0].ord - 'A'.ord
     first_row_val = row[1].to_i
     
     if row[4] == '*'
        operator = row[3..4]
        second_column_val = row[6].ord - 'A'.ord
        second_row_val = row[7].to_i
     else
     	operator = row[3]
     	second_column_val = row[5].ord - 'A'.ord
        second_row_val = row[6].to_i
     end
     if excel[first_column_val][first_row_val].class.to_s == 'Fixnum'
     	op1 = excel[first_column_val][first_row_val]
     else
     	op1 = evaluate_exp(excel,excel[first_column_val][first_row_val])
     end
     if excel[second_column_val][second_row_val].class.to_s == 'Fixnum'
     	op2 = excel[second_column_val][second_row_val]
     else
     	op2 = evaluate_exp(excel,excel[second_column_val][second_row_val])
     end
   end
   return calc(op1,op2,operator)
end


def excel_print(arr)
   
   arr.each do |col|
   	col.each do |row|
   	 if row.class.to_s == 'Fixnum'
   	    print row
   	 else
   	 	print evaluate_exp(arr,row)
   	 end
   	 print " "
   	end
   	print "\n"
    end 

end



excel = Array.new(10){Array.new(10,0)}

while(1) do
	
		puts "Action List"
		puts "1) Set Value"
        puts "2) Set expression"
        puts "3) Exit"
        puts "Enter Choice"
        choice = gets.chomp
        choice = choice.to_i
        if choice == 1
          puts "set the value"
          exp = gets.chomp
          column_value = exp[0].ord - 'A'.ord
          row_value = exp[1].to_i
          if exp[5] == '-'
            excel[column_value][row_value] = -1 * exp[6].to_i
          else
          	excel[column_value][row_value] = exp[5].to_i
          end
          excel_print(excel)
        elsif choice == 2
            puts "set the expression"
            exp = gets.chomp
            column_value = exp[0].ord - 'A'.ord
            row_value = exp[1].to_i
            excel[column_value][row_value] = exp[5..-1]
            excel_print(excel)
        elsif choice ==3
           break
        else
        	puts "Enter correct choice"
        end

         
end



