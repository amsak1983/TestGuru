class Test < ApplicationRecord
  def self.tests_of_category(category_name)
    joins('JOIN categories ON categories_id = tests.category.id')
      .where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
