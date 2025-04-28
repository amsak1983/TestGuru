class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :image_url
      t.string :image
      t.string :rule
      t.string :value
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
