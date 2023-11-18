# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  default to: %("TestGuru" <admin@testguru.com>)

  def send_message(feedbacks)
    @name = feedbacks.name
    @email = feedbacks.email
    @message = feedbacks.message

    mail from: @email
  end
end
