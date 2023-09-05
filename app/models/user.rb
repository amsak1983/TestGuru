# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable

  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :email, uniqueness: { case_sensitive: false }, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true
  validates :username, :email, presence: true

  def show_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :DESC).find_by(test_id: test.id)
  end
end
