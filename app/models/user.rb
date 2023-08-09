class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  validates :name, :email, :role, presence: true

  def show_tests(level)
    tests.where(level: level)
  end
end
