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
    @song = Song.new
  end

  def create
    @song = Song.new
    if @song.save
      redirect_to song_path(@song)
    else
      flash[:danger] = "Error Uploading File"
      redirect_to new_song_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
