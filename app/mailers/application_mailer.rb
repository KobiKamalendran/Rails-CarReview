class ApplicationMailer < ActionMailer::Base
  default to: "info@cars.com", from: "info@cars.com"
  layout 'mailer'
end
