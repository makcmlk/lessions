puts "Введите первый коэффициент"
a = gets.chomp.to_i

puts "Введите второй коэффициент"
b = gets.chomp.to_i

puts "Введите третий коэффициент"
c = gets.chomp.to_i

d = b*b-4.0*a*c

if disc < 0
  print "Нет корней :("
elsif disc == 0
  root = -(b/2.0*a)
  print "Дискриминант = 0, единственный корень: #{root}"
else
  first_root = (-1.0*b + Math.sqrt(disc))/(2.0*a)
  second_root = (-1.0*b - Math.sqrt(disc))/(2.0*a)
  print "Дискриминант = #{disc}, первый корень: #{first_root}, второй корень: #{second_root}"
end
