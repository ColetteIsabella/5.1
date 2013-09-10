class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(params[:id])

    if @user.save
      flash[:notice]= "User has been saved."
      redirect_to root_url
    else
      flash[:notice]="User has not been created."
      render action: "new"
     end
   end


  def update
    if @user.update(user_params)
      flash[:notice] = "User has been updated."
      redirect_to root_url
    else
      flash[:notice] = "User cannot be updated"
    end
  end



  def destroy
    @user.destroy
    redirect_to root_url
  end


private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email)
  end
end

