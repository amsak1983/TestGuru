class Test < ApplicationRecord
  def self.tests_of_category(category_name)
    joins('JOIN categories ON categories.id = tests.category_id')
    .where(categories: {title: category_name})
    .order(id: DESC)
    .pluck(:title)
  end
end
