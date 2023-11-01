# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <testguruproj@gmail.com>)
  layout 'mailer'
end
