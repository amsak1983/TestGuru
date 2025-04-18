# frozen_string_literal: true

# == Schema Information
#
# Table name: test_passages
#
#  id                  :bigint           not null, primary key
#  correct_questions   :integer          default(0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  current_question_id :bigint
#  test_id             :bigint           not null
#  user_id             :bigint           not null
#
# Indexes
#
#  index_test_passages_on_current_question_id  (current_question_id)
#  index_test_passages_on_test_id              (test_id)
#  index_test_passages_on_user_id              (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (current_question_id => questions.id)
#  fk_rails_...  (test_id => tests.id)
#  fk_rails_...  (user_id => users.id)
#
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

  def time_expired?
    (Time.current - created_at) >= test.duration.seconds
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
    correct_answer.ids.sort == answer_ids.map(&:to_i).sort if answer_ids.present?
  end

  def correct_answer
    current_question.answers.correct
  end
end
