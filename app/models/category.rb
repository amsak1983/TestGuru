# frozen_string_literal: true

# app/models/category.rb
class Category < ApplicationRecord
  has_many :tests, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  scope :sort_by_title, -> { order(:title) }
end
