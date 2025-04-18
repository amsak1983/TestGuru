# frozen_string_literal: true

# == Schema Information
#
# Table name: badges
#
#  id         :bigint           not null, primary key
#  image      :string
#  image_url  :string
#  rule       :string
#  status     :integer          default("inactive")
#  title      :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Badge < ApplicationRecord
  enum status: { inactive: 0, active: 1 }

  scope :active, -> { where(status: :active) }
  scope :inactive, -> { where(status: :inactive) }

  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges
end
