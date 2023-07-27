# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

creater = User.create!(name: 'Bob', role: 'creater')
user = User.create!(name: 'Tom', role: 'user')

category = Category.create!(title: 'category1')

tests = Test.create!([{title: 'test1', level: 0, category_id: category.id, author_id: creater.id},
                      {title: 'test2', level: 1, category_id: category.id, author_id: creater.id},
                      {title: 'test3', level: 2, category_id: category.id, author_id: creater.id}])

tests.each do |test|
  Question.create!([{body: 'question1', test_id: test.id},
                    {body: 'question2', test_id: test.id},
                    {body: 'question3', test_id: test.id}])
end

Question.all.each do |question|
  Answer.create!([{body: 'answer1', correct: false, question_id: question.id},
                  {body: 'answer2', correct: true, question_id: question.id},
                  {body: 'answer3', correct: false, question_id: question.id},
                  {body: 'answer4', correct: false, question_id: question.id}])
end

Result.create!([{status: true, test_id: 1, user_id: user.id},
                {status: true, test_id: 2, user_id: user.id},
                {status: false, test_id: 3, user_id: user.id}])
                