class CreateTestPassages < ActiveRecord::Migration[7.0]
  def change
    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :current_qustion, foreign_key: { to_table: :questions }
      t.integer :correct_qustions, default: 0

      t.timestamps
    end
  end
end
