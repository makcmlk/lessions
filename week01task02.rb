puts "Приветствую, пожалуйста введите основание треугольника"
base = gets.chomp.to_i

puts "Пожалуйста введите высоту треугольника"
height = gets.chomp.to_i
print "Площадь треугольника: #{base*height*0.5}"
