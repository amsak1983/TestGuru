class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  belongs_to :category

  def self.tests_of_category(category_name)
    joins(:category)
    .where(categories: {title: category_name})
    .order(id: DESC)
    .pluck(:title)
  end
end
