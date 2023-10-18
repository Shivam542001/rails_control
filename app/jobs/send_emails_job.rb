class SendEmailsJob < ApplicationJob
  queue_as :default

  def perform(user)
    CrudNotificationMailer.create_notification(user).deliver
  end
end
