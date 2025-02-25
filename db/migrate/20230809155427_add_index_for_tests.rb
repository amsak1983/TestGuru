# frozen_string_literal: true

class AddIndexForTests < ActiveRecord::Migration[7.0]
  def change
    add_index :tests, %i[title level category_id], unique: true
  end
end
