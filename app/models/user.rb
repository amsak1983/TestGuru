require 'digest/sha1'

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }, format: URI::MailTo::EMAIL_REGEXP
  validates :name, :email, presence: true

  def show_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :DESC).find_by(test_id: test.id)
  end
end