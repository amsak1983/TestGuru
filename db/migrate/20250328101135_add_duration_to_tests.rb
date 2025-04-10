class AddDurationToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :duration, :integer, default: 900 # Default duration is 15 minutes (in seconds)
  end
end
