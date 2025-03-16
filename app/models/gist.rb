# frozen_string_literal: true

# == Schema Information
#
# Table name: gists
#
#  id          :bigint           not null, primary key
#  url         :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_gists_on_question_id  (question_id)
#  index_gists_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_id => users.id)
#
class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :url, presence: true
end
