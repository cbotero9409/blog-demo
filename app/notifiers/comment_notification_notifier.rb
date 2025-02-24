# To deliver this notification:
#
# CommentNotificationNotifier.with(record: @post, message: "New post").deliver(User.all)

class CommentNotificationNotifier < ApplicationNotifier
  # Add your delivery methods
  #
  # deliver_by :email do |config|
  #   config.mailer = "UserMailer"
  #   config.method = "new_post"
  # end
  #
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end

  # Add required params
  #
  # required_param :message

  notification_methods do
    def message
      @comment = Comment.includes([:user, :post]).find(params[:comment][:id])
      "#{@comment.user.email} commented on #{@comment.post.title.truncate(10)}"
    end

    # URL helpers are available here too
    def url
      post_path(Post.find(params[:comment][:post_id]))
    end
  end
end
