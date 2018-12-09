require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
  	mail = ContactMailer.contact_email("Matthew","matthew@me.com",@message="Hello")
  	assert_equal ['info@cars.com'], mail.to
  	assert_equal ['info@cars.com'], mail.from
  end
end
