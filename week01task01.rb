puts "Приветствую, пожалуйста представтесь"
name = gets.chomp

puts "Пожалуйста введите свой рост"
height = gets.chomp.to_i
weight = height - 110
case weight
  when weight > 0
    print "#{name}, Ваш идеальный вес - #{weight}!"
  when height - 110 <= 0
    print "#{name}, Ваш идеальный вес рассчитывается при помощи другой формулы!"
end
