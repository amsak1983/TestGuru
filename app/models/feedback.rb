# frozen_string_literal: true

class Feedback < ApplicationRecord
  validates :message, :name, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP
end