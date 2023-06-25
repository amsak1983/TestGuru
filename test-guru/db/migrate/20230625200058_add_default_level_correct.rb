class AddDefaultLevelCorrect < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:tests, :level, 0)
    change_column_default(:answers, :correct, false)
  end
end
