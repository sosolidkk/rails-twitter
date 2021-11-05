json.array! @notifications do |notification|
  json.id notification.id
  json.actor notification.actor.fake_username || notification.actor.username
  json.action notification.action
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url tweet_path(notification.notifiable, anchor: dom_id(notification.notifiable))
end