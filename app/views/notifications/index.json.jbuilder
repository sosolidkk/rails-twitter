json.array! @notifications do |notification|
  json.id notification.id
  json.actor notification.actor.fake_username || notification.actor.username
  json.action notification.action
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  if notification.notifiable.class.name.downcase == "tweet"
    json.url tweet_path(notification.notifiable, anchor: dom_id(notification.notifiable))
  elsif notification.notifiable.class.name.downcase == "comment"
    json.url tweet_path(notification.notifiable.tweet, anchor: dom_id(notification.notifiable.tweet))
  end
end
