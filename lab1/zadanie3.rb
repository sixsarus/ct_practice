# Создаем массив для хранения студентов
students = []

# Запрашиваем количество студентов
puts "Сколько студентов вы хотите добавить?"
number_of_students = gets.chomp.to_i

# Собираем данные о каждом студенте
number_of_students.times do |i|
  puts "Введите данные для студента ##{i + 1}:"

  # Сбор информации о студенте
  print "Имя: "
  name = gets.chomp

  print "Возраст: "
  age = gets.chomp.to_i

  print "Пол (мужской - :male, женский - :female): "
  gender_input = gets.chomp.downcase
  gender = gender_input == 'мужской' ? :male : :female

  print "Группа: "
  course = gets.chomp

  print "Электронная почта: "
  email = gets.chomp

  # Добавляем студента в массив
  students << { name: name, age: age, gender: gender, course: course, email: email }
end

# Выводим информацию о студентах
puts "\nДанные о студентах:"
students.each_with_index do |student, index|
  puts "#{index + 1}. [#{student[:name]}]:"
  puts "  - #{student[:age]} лет"
  puts "  - #{student[:gender]}"
  puts "  - #{student[:course]}"
  puts "  - #{student[:email]}"
end