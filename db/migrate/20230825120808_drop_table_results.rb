# frozen_string_literal: true

class DropTableResults < ActiveRecord::Migration[7.0]
  def up
    drop_table :results, if_exists: true
  end
end
