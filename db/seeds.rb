# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin = Admin.create!(first_name: 'Bob', last_name: 'Cooper', username: 'bobcop', email: 'ams@yandex.by', type: 'Admin',
                      password: 'zse4321')
user = User.create!(first_name: 'Tom', last_name: 'Cooper', username: 'tomcop', email: 'tom09@gmail.com', type: 'User',
                    password: 'testguru')

category = Category.create!(title: 'category1')

tests = Test.create!([{ title: 'test1', level: 0, category: category, creator: admin },
                      { title: 'test2', level: 1, category: category, creator: admin },
                      { title: 'test3', level: 2, category: category, creator: admin }])

tests.each do |test|
  Question.create!([{ body: 'question1', test: },
                    { body: 'question2', test: },
                    { body: 'question3', test: }])
  TestPassage.create!(user: user, test: test, current_question: test.questions.first, correct_questions: 0)
end

Question.all.each do |question|
  Answer.create!([{ body: 'answer1', correct: false, question: },
                  { body: 'answer2', correct: true, question: },
                  { body: 'answer3', correct: false, question: },
                  { body: 'answer4', correct: false, question: }])
end
