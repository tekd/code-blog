class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      flash[:notice] = ["Signed in successfully."]
      redirect_to root_path
    else
      flash[:alert] = ["Invalid Username/Password."]
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :role, :password)
  end
end
