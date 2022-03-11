# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :actor, class_name: 'User'
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }

  def self.create_notifications(actor, notifiable)
    # When the follow functionality is implemented, this should be changed to
    # something like current_user.followers.each do |follower|
    User.all_except(actor).each do |user|
      Notification.create(recipient: user, actor: actor, action: 'created', notifiable: notifiable)
    end
  end
end
