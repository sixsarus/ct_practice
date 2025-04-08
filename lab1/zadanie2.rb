def equal_to_twenty?(num1, num2)
  if num1 == 20 || num2 == 20
    return num1 == 20 ? num2 : num1
  else
    return num1 + num2
  end
end

# Запрашиваем у пользователя ввод чисел
puts "Введите первое число:"
first_number = gets.chomp.to_i

puts "Введите второе число:"
second_number = gets.chomp.to_i

# Вызываем метод и выводим результат
result = equal_to_twenty?(first_number, second_number)
puts "Результат: #{result}"