class User < ApplicationRecord
  def show_tests(level)
    Test.joins('JOIN results ON results.test_id = tests.id')
    .where(level: level, results: {user_id: id})
  end
end
