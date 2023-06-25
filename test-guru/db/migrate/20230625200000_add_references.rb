class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference(:tests, :category)
    add_reference(:questions, :test)
    add_reference(:answers, :question)
  end
end
