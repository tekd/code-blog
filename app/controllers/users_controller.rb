class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session["user_id"] = @user.user_id
      redirect to root_path
    else
      flash[:alert] = @user.errors.full_messages
      render :new
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.assign_attributes(user_params)
      if @user.save
        redirect_to root_path, notice: ["Your account has been updated."]
      else
        flash[:alert] = @user.errors.full_messages
        redirect_to root_path
      end

    end

    private

    def user_params
      params.require(:user).permit(:username, :email, :role, :password)
    end


end