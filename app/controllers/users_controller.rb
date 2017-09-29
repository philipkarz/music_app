class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @songs = @user.songs
    @comment = Comment.new
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
    @user = User.find(params[:id])
    unless current_user == @user
      flash[:danger] = "Do Not Attempt To Edit Another User"
      redirect_to new_session_path
    end
  end

  def update
    #gets called on edit form submission
    @user = current_user
    @user.username = params[:user][:username]
    @user.chadress = params[:user][:chadress]
    @user.hometown = params[:user][:hometown]
    @user.avatar = params[:user][:avatar]
    @user.covimg = params[:user][:covimg]
    @user.facebook = params[:user][:facebook]
    @user.twitter = params[:user][:twitter]
    @user.instagram = params[:user][:instagram]
    @user.spotify = params[:user][:spotify]

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    session.clear
    @user.destroy
    redirect_to root_path
  end

  private
  #makes sure you cant do things like adding an admin field and making it true
  #user_params is anything we will use in user#create
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar, :covimg)
    #password_confirmation makes passwords have to match to be saved
  end
end
