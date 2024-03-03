# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <admin@testguru.com>)
  layout 'mailer'
end
