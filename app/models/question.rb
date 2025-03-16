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

  #validate :at_least_one_correct_answer
  validates :body, presence: true
  #validates :answers, length: { minimum: 2, message: "Question must have at least 2 answers" }
  accepts_nested_attributes_for :answers,
                                allow_destroy: true,
                                reject_if:     :all_blank


  private
  def at_least_one_correct_answer
    errors.add(:answers, "Question must have at least one correct answer") unless answers.any?(&:correct)
  end


end
