class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:past_url] || root_path, notice: 'Welcome!'
    else
      flash.now[:alert] = 'Verify your Email and Password please!'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to login_path, notice: 'You are logged out!'
  end
end
