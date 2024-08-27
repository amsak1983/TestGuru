# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.destroy_all
admin = Admin.find_or_create_by!(first_name: 'Alexey', last_name: 'Kasabutsky', username: 'bobcop', email: 'amsak@yandex.by', type: 'Admin',
                      password: 'zse4321')
user = User.create!(first_name: 'Bos', last_name: 'Kasabutsky', username: 'bobcop', email: 'am@yandex.by', type: 'User',
                      password: 'z4321')

category = Category.find_or_create_by!(title: 'category1')

Test.destroy_all
tests = Test.find_or_create_by!([{ title: 'test1', level: 0, category: category, creator: admin },
                                 { title: 'test2', level: 1, category: category, creator: admin },
                                 { title: 'test3', level: 2, category: category, creator: admin }])

tests.each do |test|
  Question.find_or_create_by!([{ body: 'question1', test: },
                               { body: 'question2', test: },
                               { body: 'question3', test: }])
  TestPassage.find_or_create_by!(user: user, test: test, current_question: test.questions.first, correct_questions: 0)
end
                  
Question.all.each do |question|
  Answer.find_or_create_by!([{ body: 'answer1', correct: false, question: question },
                             { body: 'answer2', correct: true, question: question },
                             { body: 'answer3', correct: false, question: question },
                             { body: 'answer4', correct: false, question: question }])
end
