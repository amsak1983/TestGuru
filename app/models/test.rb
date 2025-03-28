# frozen_string_literal: true

# == Schema Information
#
# Table name: tests
#
#  id          :bigint           not null, primary key
#  level       :integer          default("medium"), not null
#  status      :integer          default("draft")
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  creator_id  :bigint           not null
#
# Indexes
#
#  index_tests_on_category_id                      (category_id)
#  index_tests_on_creator_id                       (creator_id)
#  index_tests_on_title_and_level_and_category_id  (title,level,category_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (creator_id => users.id)
#
class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true, uniqueness: { scope: %i[level category_id] }

  enum level: { easy: 0, medium: 1, hard: 2 }
  enum status: { draft: 0, active: 1 }

  scope :easy, -> { where(level: :easy) }
  scope :medium, -> { where(level: :medium) }
  scope :hard, -> { where(level: :hard) }
  scope :ready, -> { where(status: 1) }
  scope :by_category, ->(category_title) { joins(:category).where(categories: { title: category_title }) }

  def self.titles_by_category(category_title)
    by_category(category_title).pluck(:title)
  end
end
