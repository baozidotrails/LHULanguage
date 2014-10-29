class NotificationsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @notifications = @user.notifications
    @notifications.update_all(is_checked: true)
  end
end