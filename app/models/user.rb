class User < ApplicationRecord

  after_create :send_welcome_email

  private
  def send_welcome_email
  #   SendEmailsJob.perform_now(self)
  SendEmailsJob.set(wait_until: Time.now+15).perform_later(self)
  end
end
