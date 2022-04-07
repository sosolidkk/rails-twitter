# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'fish-vault@outlook.com'
  layout 'mailer'
end
