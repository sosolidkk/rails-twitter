# frozen_string_literal: true

json.array! @notifications do |notification|
  json.id notification.id
  json.notifiable_id notification.notifiable.id
  json.actor notification.actor.fake_username || notification.actor.username
  json.action notification.action
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  case notification.notifiable.class.name.downcase
  when 'tweet'
    json.url tweet_path(notification.notifiable, anchor: dom_id(notification.notifiable))
  when 'comment'
    json.url tweet_path(notification.notifiable.tweet, anchor: dom_id(notification.notifiable.tweet))
  end
end
