class ApplicationMailer < ActionMailer::Base
	# Setting default mailer sender and receipient
  default to: "info@cars.com", from: "info@cars.com"
  layout 'mailer'
end
