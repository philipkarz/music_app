class SongsController < ApplicationController
  def index
    @songs = Song.all
    @users = User.all
    @comment = Comment.new
  end

  def show
    @song = Song.find(params[:id])
    @comment = Comment.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
