# frozen_string_literal: true

class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference(:tests, :category, null: false)
    add_reference(:questions, :test, null: false)
    add_reference(:answers, :question, null: false)
    add_reference(:tests, :users, null: false)
  end
end
