# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# app/models/category.rb
class Category < ApplicationRecord
  has_many :tests, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  scope :sort_by_title, -> { order(:title) }
end
