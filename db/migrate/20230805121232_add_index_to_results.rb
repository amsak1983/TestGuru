class AddIndexToResults < ActiveRecord::Migration[7.0]
  def change
    add_index :results, %i[tests users]
  end
end
