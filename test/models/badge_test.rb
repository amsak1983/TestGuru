# == Schema Information
#
# Table name: badges
#
#  id         :bigint           not null, primary key
#  image      :string
#  image_url  :string
#  rule       :string
#  status     :integer          default(0)
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class BadgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
