# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <amsak@yandex.by>)
  layout 'mailer'
end
