# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  test_id    :bigint           not null
#
# Indexes
#
#  index_questions_on_test_id  (test_id)
#
# Foreign Keys
#
#  fk_rails_...  (test_id => tests.id)
#
class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy, inverse_of: :question
  has_many :gists, dependent: :destroy
  has_many :test_passages, foreign_key: :current_question_id, dependent: :destroy

  validates :body, presence: true
  accepts_nested_attributes_for :answers,
                                allow_destroy: true,
                                reject_if:     :all_blank
end
