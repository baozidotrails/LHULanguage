class SessionsController < ApplicationController
  layout 'auth_things', only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or user,
        success: "歡迎，#{user.name}"
    else
      flash.now[:danger] = '無效的E-mail 或密碼'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url,
      success: "您已經登出！"
  end
end