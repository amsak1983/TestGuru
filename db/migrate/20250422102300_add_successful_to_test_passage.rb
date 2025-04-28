class AddSuccessfulToTestPassage < ActiveRecord::Migration[7.0]
  def change
    add_column :test_passages, :successful, :boolean
  end
end
