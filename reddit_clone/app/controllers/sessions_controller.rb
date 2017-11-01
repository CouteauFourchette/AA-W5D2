class SessionsController < ApplicationController
  skip_before_action :check_login, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.get_with_credentials(user_params[:username], user_params[:password])
    if @user
      login!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ['Username or Password is invalid']
      @user = User.new
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit([:username, :password])
  end
end
