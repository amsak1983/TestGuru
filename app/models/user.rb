class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :name, :email, :role, presence: true

  def show_tests(level)
    tests.where(level: level)
  end

  def test_passages(test)
    test_passages.order(id: :DESC).find(test_id: test.id)
  end
end
