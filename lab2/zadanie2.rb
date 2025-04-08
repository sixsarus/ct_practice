class StudentManager
FILE_NAME = 'students.txt'

# Загружаем всех студентов
def index
  if File.exist?(FILE_NAME)
    File.read(FILE_NAME)
  else
    "Файл не найден"
  end
end

# Найти студента по ID (исправленная версия)
def find(id)
  student_data = []
  found = false
  
  File.foreach(FILE_NAME) do |line|
    if line.start_with?("#{id}.") || found
      student_data << line
      found = true
      # Мы нашли 6 строк (1 заголовок + 5 данных)
      break if student_data.size == 6
    end
  end
  
  student_data.empty? ? "Студент с ID #{id} не найден" : student_data.join
  rescue
  "Ошибка при чтении файла"
  end

  # Найти студентов по паттерну
  def where(pattern)
    result = []
    File.foreach(FILE_NAME) do |line|
      if line.include?(pattern)
        # Добавляем найденного студента (5 строк)
        student = [line]
        4.times { student << File.readline }
        result << student.join
      end
    end
    result.empty? ? "Не найдено" : result.join("\n")
  end

  # Добавить студента
  def create(name, age, gender, group, email, phone)
    new_id = last_id + 1
    student = [
      "#{new_id}. #{name}:",
      "  - #{age} лет,",
      "  - #{gender},",
      "  - #{group},",
      "  - #{email},",
      "  - #{phone};"
    ].join("\n")

    File.open(FILE_NAME, 'a') { |f| f.puts student }
    "Студент добавлен с ID #{new_id}"
  end

  private

  # Получить последний ID
  def last_id
    last_line = File.foreach(FILE_NAME).last
    last_line ? last_line.split('.').first.to_i : 0
  rescue
    0
  end
end

# Создаем менеджер
manager = StudentManager.new

# Простой интерфейс
loop do
  puts "\nВыберите действие:"
  puts "1 - Показать всех (index)"
  puts "2 - Найти по ID (find)"
  puts "3 - Поиск по тексту (where)"
  puts "4 - Добавить студента (create)"
  puts "0 - Выход"

  print "> "
  choice = gets.chomp

  case choice
  when '1'
    puts "\nВсе студенты:"
    puts manager.index

  when '2'
    print "Введите ID студента: "
    id = gets.to_i
    puts manager.find(id)

  when '3'
    print "Введите текст для поиска: "
    text = gets.chomp
    puts manager.where(text)

  when '4'
    puts "Введите данные студента:"
    print "Имя: ";    name = gets.chomp
    print "Возраст: "; age = gets.chomp
    print "Пол (М/Ж): "; gender = gets.chomp
    print "Группа: ";  group = gets.chomp
    print "Email: ";   email = gets.chomp
    print "Телефон: "; phone = gets.chomp

    puts manager.create(name, age, gender, group, email, phone)

  when '0'
    break

  else
    puts "Неверный выбор"
  end
end