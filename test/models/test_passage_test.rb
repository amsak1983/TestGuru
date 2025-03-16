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
require 'test_helper'

class TestPassageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
