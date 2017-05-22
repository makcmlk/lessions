print "Введите первую сторону: "
a = gets.chomp.to_i

print "Введите вторую сторону: "
b = gets.chomp.to_i

print "Введите третью сторону: "
c = gets.chomp.to_i

if a == b && a == c
  puts "Треугольник равнобедренный!"
end

side = [a,b,c].sort!

if  side[2]**2 == side[1]**2 + side[0]**2
  puts "Треугольник прямоугольный!"
else
  puts "Треугольник не прямоугольный!"
end
