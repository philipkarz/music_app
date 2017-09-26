class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @songs = @user.songs
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id#logs them in while signing them up 
      #stores into a cookie called user id
      #it is encrypted
      redirect_to root_path
    else
      redirect_to new_user_path
      flash[:danger] = "unable to set up new user"
    end
  end

  def edit
    #edit user if signed in
  end

  def update
    #gets called on edit form submission
  end

  def destroy
  end

  private
  #makes sure you cant do things like adding an admin field and making it true
  #user_params is anything we will use in user#create
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
    #password_confirmation makes passwords have to match to be saved
  end
end
