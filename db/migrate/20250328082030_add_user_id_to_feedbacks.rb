class AddUserIdToFeedbacks < ActiveRecord::Migration[7.0]
  def change
    add_reference :feedbacks, :user, foreign_key: true, index: true
  end
end
