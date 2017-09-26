class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])#find_by_ is auto generated
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id#taking the users id and embedding it in cookie
      redirect_to songs_path#rails will know which profile we are going to
    else
      redirect_to new_session_path
      #give message if incorrect info
      #danger is red color
      flash[:danger] = "Incorrect Email and/or Password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
