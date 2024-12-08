class AddReadyStatusToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :status, :boolean, default: false
  end
end
