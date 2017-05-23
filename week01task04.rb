puts "Введите первый коэффициент"
a = gets.chomp.to_f

puts "Введите второй коэффициент"
b = gets.chomp.to_f

puts "Введите третий коэффициент"
c = gets.chomp.to_f

disc = b**2 - 4.0 * a * c

if disc < 0
  print "Нет корней :("
elsif disc == 0
  root = -b / 2.0 * a
  print "Дискриминант = 0, единственный корень: #{root}"
else
  disc_sqrt = Math.sqrt(disc)
  first_root = (-b + disc_sqrt) / (2.0 * a)
  second_root = (-b - disc_sqrt) / (2.0 * a)
  print "Дискриминант = #{disc}, первый корень: #{first_root}, второй корень: #{second_root}"
end
