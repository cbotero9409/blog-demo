class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :noticed_events, as: :record, dependent: :destroy, class_name: "Noticed::Event"
  has_many :notifications, through: :noticed_events, class_name: "Noticed::Notification"

  has_rich_text :body

  def self.ransackable_attributes(auth_object = nil)
    super + ["title"]
  end

  def self.ransackable_associations(auth_object = nil)
    super + ["user", "rich_text_body"]
  end
end
