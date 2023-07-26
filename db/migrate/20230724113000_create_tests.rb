class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 0
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :autor, null: false, foreign_key: { to_table: :user }

      t.timestamps
    end
  end
end

