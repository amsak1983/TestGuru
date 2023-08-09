# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

creator = User.create!(name: 'Bob', email: 'bob@gmail.com', role: 'creator')
user = User.create!(name: 'Tom', email: 'tom@gmail.com', role: 'user')

category = Category.create!(title: 'category1')

tests = Test.create!([{title: 'test1', level: 0, category: category, creator: creator},
                      {title: 'test2', level: 1, category: category, creator: creator},
                      {title: 'test3', level: 2, category: category, creator: creator}])

tests.each do |test|
  Question.create!([{body: 'question1', test: test},
                    {body: 'question2', test: test},
                    {body: 'question3', test: test}])
end

Question.all.each do |question|
  Answer.create!([{body: 'answer1', correct: false, question: question},
                  {body: 'answer2', correct: true, question: question},
                  {body: 'answer3', correct: false, question: question},
                  {body: 'answer4', correct: false, question: question}])
end

Result.create!([{status: true, test: tests[1], user: user},
                {status: true, test: tests[2], user: user},
                {status: false, test: tests[3], user: user}])
                