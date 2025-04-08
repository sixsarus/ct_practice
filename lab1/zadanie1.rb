def greet

  puts "Как тебя зовут?"

  name = gets.chomp  # chomp убирает Enter после ввода



  puts "Какая у тебя фамилия?"

  surname = gets.chomp



  puts "Сколько тебе лет?"

  age = gets.to_i


# Выводим результат

if age < 18

  puts "Привет, #{name} #{surname}. Тебе меньше 18, но начать учиться программировать никогда не рано!"

else

  puts "Привет, #{name} #{surname}. Самое время заняться делом!"

end

end

greet