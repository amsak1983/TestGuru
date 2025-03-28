class AddReadyStatusToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :status, :integer, default: 0
  end
end
