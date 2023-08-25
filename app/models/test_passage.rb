class TestPassage < ApplicationRecord
  COMPLETION_SCORE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def percentage_completion
    (self.correct_questions / questions_count.to_f * 100).round
  end

  def successful_passage?
    percentage_completion >= COMPLETION_SCORE
  end

  def questions_count
    test.questions.count
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  private

  def before_validation_set_first_question
    if current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = next_question
    end
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answer.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answer
    current_question.answers.correct
  end
end
