# frozen_string_literal: true

module NotificationsHelper
  def notification_url(notification)
    case notification.notifiable.class.name.downcase
    when 'tweet'
      tweet_path(notification.notifiable, anchor: dom_id(notification.notifiable))
    when 'comment'
      tweet_path(notification.notifiable.tweet, anchor: dom_id(notification.notifiable.tweet))
    end
  end

  def notification_message(notification)
    "#{notification_actor(notification)} #{notification.action} #{notification_type(notification)}"
  end

  def notification_type(notification)
    "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end

  def notification_actor(notification)
    notification.actor.fake_username || notification.actor.username
  end

  def dynamic_classname(notifications)
    'disabled' if notifications.empty?
  end
end
