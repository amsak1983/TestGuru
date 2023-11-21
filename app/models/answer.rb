class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :limit_answers, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def limit_answers
    errors.add(:base, 'Maximum 4 answers for 1 question') if question.answers.count >= 4
  end
end
