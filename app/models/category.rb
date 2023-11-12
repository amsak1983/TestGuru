# frozen_string_literal: true

class Category < ApplicationRecord
  default_score { order(:title) }

  has_many :tests, dependent: :destroy

  validates :title, presence: true
end
