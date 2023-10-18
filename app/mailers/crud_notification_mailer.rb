class CrudNotificationMailer < ApplicationMailer

  
  def create_notification(object)
    @object = object
    @object_count = object.class.count
    attachments['images.jpeg'] = File.read('app/assets/images/images.jpeg')
    mail to: "shtripathi@bestpeers.in", bcc: "osmmishra92@gmail.com", subject: "new #{object.class} created"
  end

  def update_notification(object)
    @object = object
    @object_count = object.class.count
    
    mail to: "shtripathi@bestpeers.in", subject: "#{object.class} has been updated"
  end

  def delete_notification(object)
    @object = object
    @object_count = object.class.count
    
    mail to: "osmmishra92@gmail.com",bcc: "shtripathi@bestpeers.in", subject: "#{object.class} has been deleted"
  end
end
