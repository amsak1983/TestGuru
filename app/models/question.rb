# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy, inverse_of: :question
  has_many :gists, dependent: :destroy
  has_many :test_passages, foreign_key: :current_question_id, dependent: :destroy

  validates :body, presence: true

  accepts_nested_attributes_for :answers,
                                allow_destroy: true,
                                reject_if:     :all_blank

  validate :validate_answers_count

  private

  def validate_answers_count
    # если добавлен хотябы один ответ
    if answers.size > 1
      errors.add(:base, 'Question must have at least 2 answers') if answers.count(&:persisted?) < 2
      errors.add(:base, 'Question must have at least one correct answer') unless answers.any?(&:correct?)
    end
  end
end
