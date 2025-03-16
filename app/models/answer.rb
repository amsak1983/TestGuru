# frozen_string_literal: true

# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  body        :string           not null
#  correct     :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
class Answer < ApplicationRecord
  belongs_to :question, inverse_of: :answers

  #validates :body, presence: true
  validate :limit_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def limit_answers
    errors.add(:base, 'Maximum 4 answers for 1 question') if question.answers.count >= 4
    errors.add(:base, I18n.t('admin.answers.limit_exceeded')) if question.answers.count >= 4
  end
end
