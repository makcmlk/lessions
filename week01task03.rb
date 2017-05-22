print "Введите первую сторону: "
a = gets.chomp.to_i

print "Введите вторую сторону: "
b = gets.chomp.to_i

print "Введите третью сторону: "
c = gets.chomp.to_i

if a == b || a == c || b == c
  puts "Треугольник равнобедренный!"
end

if (a >= b) && (a>=c)
  x = a
  y = b
  z = c
elsif (b>=a) && (b>=c)
  x = b
  y = a
  z = c
elsif (c>=a) && (c>=b)
  x = c
  y = a
  z = b
end

if x*x == y*y + z*z
  puts "Треугольник прямоугольный: #{x*x} == #{y*y} + #{z*z}"
else
  puts "Треугольник не прямоугольный:  #{x*x} != #{y*y} + #{z*z}"
end
