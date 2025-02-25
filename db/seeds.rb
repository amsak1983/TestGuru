# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Очистка базы данных перед заполнением
User.destroy_all
Category.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all

admin = User.create!(first_name: 'Alexey', last_name: 'Kasabutsky', username: 'bobcop', email: 'amsak@yandex.by', admin: true,
                     password: 'zse4321')

# Создание категорий
category_9 = Category.create!(title: 'Информатика 9 класс')
category_10 = Category.create!(title: 'Информатика 10 класс')
category_11 = Category.create!(title: 'Информатика 11 класс')

# Создание тестов для 9 класса
test_9_easy = Test.create!(title: 'Основы Алгоритмизации и Программирование', level: :easy, category: category_9, 
                           creator: admin)
test_9_medium = Test.create!(title: 'Компьютерные Сети и Интернет', level: :medium, category: category_9, 
                             creator: admin)
test_9_hard = Test.create!(title: 'Информационная Безопасность и Этика', level: :hard, category: category_9, 
                           creator: admin)

# Создание тестов для 10 класса
test_10_easy = Test.create!(title: 'Программирование и Алгоритмы', level: :easy, category: category_10, creator: admin)
test_10_medium = Test.create!(title: 'Базы Данных', level: :medium, category: category_10, creator: admin)
test_10_hard = Test.create!(title: 'Информационная Безопасность и Защита Данных', level: :hard, category: category_10, 
                            creator: admin)

# Создание тестов для 11 класса
test_11_easy = Test.create!(title: 'Программирование и Алгоритмы', level: :easy, category: category_11, creator: admin)
test_11_medium = Test.create!(title: 'Компьютерные Системы и Архитектура', level: :medium, category: category_11, 
                              creator: admin)
test_11_hard = Test.create!(title: 'Информационная Безопасность и Защита Данных', level: :hard, category: category_11, 
                            creator: admin)

# Метод для создания вопросов и ответов
def create_questions_and_answers(test, questions_data)
  questions_data.each do |question_data|
    question = Question.create!(body: question_data[:body], test: test)
    answers_data = question_data[:answers]
    answers_data.each do |answer_data|
      Answer.create!(body: answer_data[:body], correct: answer_data[:correct], question: question)
    end
  end
end

# Вопросы и ответы для 9 класса
questions_9_easy = [
  {
    body:    'Что такое алгоритм?',
    answers: [
      { body: 'Набор инструкций для решения задачи.', correct: true },
      { body: 'Компьютерная программа.', correct: false },
      { body: 'Последовательность действий, приводящая к желаемому результату.', correct: true },
      { body: 'Танец робота.', correct: false }
    ]
  },
  {
    body:    'Какой тип данных используется для хранения целых чисел?',
    answers: [
      { body: 'Строка (String)', correct: false },
      { body: 'Вещественное число (Float)', correct: false },
      { body: 'Целое число (Integer)', correct: true },
      { body: 'Булев тип (Boolean)', correct: false }
    ]
  }
]

questions_9_medium = [
  {
    body:    'Что такое IP-адрес?',
    answers: [
      { body: 'Уникальный идентификатор устройства в сети.', correct: true },
      { body: 'Пароль для входа в систему.', correct: false },
      { body: 'Название веб-сайта.', correct: false },
      { body: 'Тип компьютерного вируса.', correct: false }
    ]
  },
  {
    body:    'Что такое DNS (Domain Name System)?',
    answers: [
      { body: 'Система, преобразующая доменные имена в IP-адреса.', correct: true },
      { body: 'Протокол шифрования данных.', correct: false },
      { body: 'Устройство для подключения к интернету.', correct: false },
      { body: 'Метод сжатия файлов.', correct: false }
    ]
  }
]

questions_9_hard = [
  {
    body:    'Что такое компьютерный вирус?',
    answers: [
      { body: 'Полезная программа для оптимизации работы компьютера.', correct: false },
      { body: 'Вредоносная программа, способная распространяться и наносить ущерб.', correct: true },
      { body: 'Тип операционной системы.', correct: false },
      { body: 'Программа для создания резервных копий данных.', correct: false }
    ]
  },
  {
    body:    'Что такое брандмауэр (firewall)?',
    answers: [
      { body: 'Программа для просмотра веб-страниц.', correct: false },
      { body: 'Сетевой экран, защищающий компьютер от несанкционированного доступа.', correct: true },
      { body: 'Тип компьютерного вируса.', correct: false },
      { body: 'Программа для создания графических изображений.', correct: false }
    ]
  }
]

# Заполнение вопросов и ответов для 9 класса
create_questions_and_answers(test_9_easy, questions_9_easy)
create_questions_and_answers(test_9_medium, questions_9_medium)
create_questions_and_answers(test_9_hard, questions_9_hard)

# Вопросы и ответы для 10 класса (Программирование и Алгоритмы - easy)
questions_10_easy = [
  {
    body:    'Какой из следующих языков программирования является языком высокого уровня?',
    answers: [
      { body: 'Assembly', correct: false },
      { body: 'C++', correct: true },
      { body: 'Machine Code', correct: false },
      { body: 'HTML', correct: false }
    ]
  },
  {
    body:    'Что такое рекурсия в программировании?',
    answers: [
      { body: 'Процесс выполнения программы без ошибок.', correct: false },
      { body: 'Функция, которая вызывает саму себя.', correct: true },
      { body: 'Метод оптимизации кода.', correct: false },
      { body: 'Способ хранения данных в памяти.', correct: false }
    ]
  },
  {
    body:    'Какой оператор используется для сравнения двух значений в большинстве языков программирования?',
    answers: [
      { body: '=', correct: false },
      { body: '==', correct: true },
      { body: '!=', correct: false },
      { body: '===', correct: false }
    ]
  },
  {
    body:    'Что такое массив?',
    answers: [
      { body: 'Структура данных, позволяющая хранить несколько значений одного типа.', correct: true },
      { body: 'Условие в алгоритме.', correct: false },
      { body: 'Процесс выполнения программы.', correct: false },
      { body: 'Переменная, хранящая строку текста.', correct: false }
    ]
  },
  {
    body:    'Какой из следующих алгоритмов является сортировкой?',
    answers: [
      { body: 'Алгоритм Дейкстры', correct: false },
      { body: 'Сортировка пузырьком (Bubble Sort)', correct: true },
      { body: 'Алгоритм Краскала', correct: false },
      { body: 'Поиск в глубину (Depth-First Search)', correct: false }
    ]
  }
]

# Вопросы и ответы для 10 класса (Базы Данных - medium)
questions_10_medium = [
  {
    body:    'Что такое реляционная база данных?',
    answers: [
      { body: 'База данных, основанная на таблицах с взаимосвязями между ними.', correct: true },
      { body: 'База данных, хранящая данные в виде иерархической структуры.', correct: false },
      { body: 'База данных, использующая графы для представления данных.', correct: false },
      { body: 'База данных, которая не требует структурирования данных.', correct: false }
    ]
  },
  {
    body:    'Какой язык используется для работы с реляционными базами данных?',
    answers: [
      { body: 'SQL (Structured Query Language)', correct: true },
      { body: 'HTML', correct: false },
      { body: 'XML', correct: false },
      { body: 'CSS', correct: false }
    ]
  },
  {
    body:    'Что такое первичный ключ в базе данных?',
    answers: [
      { body: 'Поле, которое уникально идентифицирует каждую запись в таблице.', correct: true },
      { body: 'Поле, которое может содержать дублирующиеся значения.', correct: false },
      { body: 'Поле, используемое для сортировки записей.', correct: false },
      { body: 'Поле, которое не может быть пустым.', correct: false }
    ]
  },
  {
    body:    'Какой из следующих запросов на SQL выбирает все записи из таблицы "Students"?',
    answers: [
      { body: 'SELECT ALL FROM Students;', correct: false },
      { body: 'SELECT * FROM Students;', correct: true },
      { body: 'GET ALL Students;', correct: false },
      { body: 'SHOW Students;', correct: false }
    ]
  },
  {
    body:    'Что такое нормализация базы данных?',
    answers: [
      { body: 'Процесс уменьшения объема базы данных.', correct: false },
      { body: 'Процесс устранения избыточности и обеспечения целостности данных.', correct: true },
      { body: 'Процесс создания резервной копии базы данных.', correct: false },
      { body: 'Процесс визуализации данных.', correct: false }
    ]
  }
]

# Вопросы и ответы для 10 класса (Информационная Безопасность и Защита Данных - hard)
questions_10_hard = [
  {
    body:    'Что такое шифрование?',
    answers: [
      { body:    'Процесс преобразования информации в недоступный вид для защиты от несанкционированного доступа.', 
        correct: true },
      { body: 'Процесс создания резервных копий данных.', correct: false },
      { body: 'Метод оптимизации работы компьютера.', correct: false },
      { body: 'Способ удаления вирусов с компьютера.', correct: false }
    ]
  },
  {
    body:    'Какие из следующих методов являются способами аутентификации? (Выберите все правильные ответы)',
    answers: [
      { body: 'Пароль', correct: true },
      { body: 'Отпечаток пальца', correct: true },
      { body: 'Секретный вопрос', correct: true },
      { body: 'Сканирование QR-кода', correct: false }
    ]
  },
  {
    body:    'Что такое вредоносное ПО (malware)?',
    answers: [
      { body: 'Программа, предназначенная для защиты компьютера от вирусов.', correct: false },
      { body:    'Вредоносное программное обеспечение, которое может повредить или нарушить работу системы.', 
        correct: true },
      { body: 'Программа для оптимизации работы компьютера.', correct: false },
      { body: 'Утилита для создания резервных копий данных.', correct: false }
    ]
  },
  {
    body:    'Какой из следующих способов является эффективным методом защиты от фишинга?',
    answers: [
      { body: 'Игнорировать подозрительные электронные письма и ссылки.', correct: true },
      { body: 'Открывать все письма от незнакомых отправителей.', correct: false },
      { body: 'Использовать один и тот же пароль для всех аккаунтов.', correct: false },
      { body: 'Делать резервные копии важных файлов на облачное хранилище.', correct: false }
    ]
  },
  {
    body:    'Что такое двухфакторная аутентификация?',
    answers: [
      { body: 'Метод аутентификации, использующий только пароль.', correct: false },
      { body:    'Метод аутентификации, требующий два различных способа подтверждения личности пользователя.', 
        correct: true },
      { body: 'Процесс восстановления пароля через электронную почту.', correct: false },
      { body: 'Способ защиты компьютера от вирусов.', correct: false }
    ]
  }
]

# Заполнение вопросов и ответов для 10 класса
create_questions_and_answers(test_10_easy, questions_10_easy)
create_questions_and_answers(test_10_medium, questions_10_medium)
create_questions_and_answers(test_10_hard, questions_10_hard)

# Вопросы и ответы для 11 класса (Программирование и Алгоритмы - easy)
questions_11_easy = [
  {
    body:    'Что такое объектно-ориентированное программирование (ООП)?',
    answers: [
      { body: 'Методология программирования, основанная на использовании объектов.', correct: true },
      { body: 'Способ написания программ на ассемблере.', correct: false },
      { body: 'Метод, использующий только процедурный подход.', correct: false },
      { body: 'Язык программирования, не поддерживающий наследование.', correct: false }
    ]
  },
  {
    body:    'Какой из следующих принципов ООП позволяет создавать новые классы на основе существующих?',
    answers: [
      { body: 'Инкапсуляция', correct: false },
      { body: 'Полиморфизм', correct: false },
      { body: 'Наследование', correct: true },
      { body: 'Абстракция', correct: false }
    ]
  },
  {
    body:    'Что такое исключение в программировании?',
    answers: [
      { body: 'Ошибка, возникающая во время выполнения программы.', correct: true },
      { body: 'Процесс оптимизации кода.', correct: false },
      { body: 'Метод шифрования данных.', correct: false },
      { body: 'Способ хранения временных данных.', correct: false }
    ]
  },
  {
    body:    'Какой из следующих алгоритмов используется для поиска элемента в отсортированном массиве?',
    answers: [
      { body: 'Линейный поиск', correct: false },
      { body: 'Бинарный поиск', correct: true },
      { body: 'Поиск в глубину', correct: false },
      { body: 'Сортировка слиянием', correct: false }
    ]
  },
  {
    body:    'Что такое тестирование программного обеспечения?',
    answers: [
      { body: 'Процесс исправления ошибок в коде.', correct: false },
      { body: 'Процесс проверки программы на соответствие требованиям и выявление ошибок.', correct: true },
      { body: 'Процесс написания документации к программе.', correct: false },
      { body: 'Процесс оптимизации производительности программы.', correct: false }
    ]
  }
]

# Вопросы и ответы для 11 класса (Компьютерные Системы и Архитектура - medium)
questions_11_medium = [
  {
    body:    'Что такое центральный процессор (ЦП)?',
    answers: [
      { body: 'Устройство для хранения данных.', correct: false },
      { body: 'Основной компонент компьютера, выполняющий вычисления и обработку данных.', correct: true },
      { body: 'Устройство для вывода информации на экран.', correct: false },
      { body: 'Устройство для подключения к интернету.', correct: false }
    ]
  },
  {
    body:    'Какой из следующих типов памяти является энергозависимым?',
    answers: [
      { body: 'ROM (постоянная память)', correct: false },
      { body: 'RAM (оперативная память)', correct: true },
      { body: 'Flash-память', correct: false },
      { body: 'Кэш-память', correct: false }
    ]
  },
  {
    body:    'Что такое архитектура компьютера?',
    answers: [
      { body: 'Структура и организация компонентов компьютера.', correct: true },
      { body: 'Программа, управляющая работой компьютера.', correct: false },
      { body: 'Способ подключения к интернету.', correct: false },
      { body: 'Процесс установки операционной системы.', correct: false }
    ]
  },
  {
    body:    'Какой из следующих компонентов отвечает за хранение данных в компьютере?',
    answers: [
      { body: 'Процессор', correct: false },
      { body: 'Оперативная память', correct: false },
      { body: 'Жесткий диск', correct: true },
      { body: 'Видеокарта', correct: false }
    ]
  },
  {
    body:    'Какой из следующих терминов описывает скорость работы процессора?',
    answers: [
      { body: 'Тактовая частота', correct: true },
      { body: 'Объем памяти', correct: false },
      { body: 'Пропускная способность', correct: false },
      { body: 'Энергопотребление', correct: false }
    ]
  }
]

# Вопросы и ответы для 11 класса (Информационная Безопасность и Защита Данных - hard)
questions_11_hard = [
  {
    body:    'Что такое криптография?',
    answers: [
      { body: 'Наука о шифровании и защите информации.', correct: true },
      { body: 'Метод удаления вирусов с компьютера.', correct: false },
      { body: 'Способ создания резервных копий данных.', correct: false },
      { body: 'Процесс оптимизации работы сети.', correct: false }
    ]
  },
  {
    body:    'Какие из следующих угроз являются примерами социальной инженерии? (Выберите все правильные ответы)',
    answers: [
      { body: 'Фишинг', correct: true },
      { body: 'Вредоносное ПО', correct: false },
      { body: 'Спам', correct: true },
      { body: 'Предоставление ложной информации для получения доступа к данным', correct: true }
    ]
  },
  {
    body:    'Что такое SSL (Secure Sockets Layer)?',
    answers: [
      { body: 'Протокол для обеспечения безопасной передачи данных в интернете.', correct: true },
      { body: 'Тип антивирусного программного обеспечения.', correct: false },
      { body: 'Метод резервного копирования данных.', correct: false },
      { body: 'Стандарт для создания веб-страниц.', correct: false }
    ]
  },
  {
    body:    'Какой из следующих методов защиты данных является наиболее эффективным?',
    answers: [
      { body: 'Использование простых паролей для всех аккаунтов.', correct: false },
      { body: 'Регулярное обновление программного обеспечения и антивирусных баз.', correct: true },
      { body: 'Игнорирование подозрительных писем и ссылок.', correct: false },
      { body: 'Хранение всех паролей в одном месте без защиты.', correct: false }
    ]
  },
  {
    body:    'Что такое брутфорс-атака?',
    answers: [
      { body: 'Метод шифрования данных с использованием ключа.', correct: false },
      { 
        body: 'Атака, при которой злоумышленник пытается перебрать все возможные комбинации паролей до нахождения правильного.', correct: true 
      },
      { body: 'Способ защиты от вирусов с помощью антивируса.', correct: false },
      { body: 'Метод восстановления данных после их потери.', correct: false }
    ]
  }
]

# Заполнение вопросов и ответов для 11 класса
create_questions_and_answers(test_11_easy, questions_11_easy)
create_questions_and_answers(test_11_medium, questions_11_medium)
create_questions_and_answers(test_11_hard, questions_11_hard)

puts 'Seeds успешно созданы!'
