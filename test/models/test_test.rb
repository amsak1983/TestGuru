# frozen_string_literal: true

# == Schema Information
#
# Table name: tests
#
#  id          :bigint           not null, primary key
#  level       :integer          default("medium"), not null
#  status      :integer          default("draft")
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  creator_id  :bigint           not null
#
# Indexes
#
#  index_tests_on_category_id                      (category_id)
#  index_tests_on_creator_id                       (creator_id)
#  index_tests_on_title_and_level_and_category_id  (title,level,category_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (creator_id => users.id)
#
require 'test_helper'

class TestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
