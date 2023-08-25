class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  belongs_to :category

  validates :title, presence: true
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :tests_of_category, lambda { |category_title|
                              joins(:category)
                                .where(categories: { title: category_title })
                                .order(id: :DESC)
                            }

  def self.tests_of_category_names(category_title)
    tests_of_category(category_title).pluck(:title)
  end
end
