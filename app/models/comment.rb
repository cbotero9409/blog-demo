class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body

  after_create_commit :notify_recipient
  has_many :noticed_events, as: :record, dependent: :destroy, class_name: "Noticed::Event"
  has_many :notifications, through: :noticed_events, class_name: "Noticed::Notification"

  private

  def notify_recipient
    CommentNotificationNotifier.with(comment: self, post: post, record: post).deliver_later(post.user)
  end
end
