# frozen_string_literal: true

# app/models/test.rb
class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: %i[level category_id] }

  enum level: { easy: 0, medium: 1, hard: 2 }

  scope :easy, -> { where(level: :easy) }
  scope :medium, -> { where(level: :medium) }
  scope :hard, -> { where(level: :hard) }
  scope :ready, -> { where(status: true) }
  scope :by_category, ->(category_title) { joins(:category).where(categories: { title: category_title }) }

  def self.titles_by_category(category_title)
    by_category(category_title).pluck(:title)
  end
end
