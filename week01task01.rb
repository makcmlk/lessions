puts "Приветствую, пожалуйста введите своё имя"
name = gets.chomp

puts "Пожалуйста введите свой рост"
height = gets.chomp.to_i
print "Уважаемый #{name}, Ваш идеальный вес - #{height - 110}!"
