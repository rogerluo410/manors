class NotificationSendingJob < ActiveJob::Base
  queue_as :notification

  def perform(**args)
    # Do something later
    @user = User.find(args[:id]).tap do | user |
      user.notifications.build(title: args[:title], notify_type: args[:notify_type])
    end
    @user.save!
  end

  after_perform do | job |
    Redis.new.publish "notify", "1"
  end
end
