# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 1
      t.references :category, foreign_key: true, null: false
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
