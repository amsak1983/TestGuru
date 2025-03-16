# frozen_string_literal: true

# == Schema Information
#
# Table name: feedbacks
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  message    :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Feedback < ApplicationRecord
  validates :message, :name, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP
end
