class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
    @user = User.show(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:id])

    if @user.save
      flash[:alert]= "User has been saved."
      redirect_to user_url(@users)
    else
      flash[:alert]="User has not been created."
      render action: "new"
  end
end

  def update
    @user = User.find(params[:id])
    if @user.update(params[:id])
      flash[:notice] = "User has been updated."
      redirect_to user_url(@user)
    else
      flash[:notice] = "User cannot be updated."
      redirect_to edit_user_url
    end
  end


  def destroy
    @user.destroy
    redirect_to root_url
  end


private

  def set_user
    @user = User.for(current_user).find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email)
  end
end

