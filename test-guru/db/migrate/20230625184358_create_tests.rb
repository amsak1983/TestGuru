class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false
      t.string :name_autor, null: false

      t.timestamps
    end
  end
end
