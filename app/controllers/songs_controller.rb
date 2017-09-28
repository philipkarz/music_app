class SongsController < ApplicationController
  def index
    genre = params[:genre_param]
    if genre == nil
      puts "genre is nil"
      @songs = Song.all
    else
      puts "genre not nil"
      @songs = Song.where(:genre => genre).to_a
    end
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
    @song.title = params[:song][:title]
    @song.genre = params[:song][:genre]
    @song.songpath = params[:song][:songpath]
    @song.user = current_user
    if @song.save
      redirect_to song_path(@song)
    else
      flash[:danger] = "Error Uploading File"
      redirect_to new_song_path
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.title = params[:song][:title]
    @song.genre = params[:song][:genre]
    @song.songpath = params[:song][:songpath]
    @song.user = current_user
    if @song.save
      redirect_to song_path(@song)
    else
      flash[:danger] = "Error Editing File"
      redirect_to song_path(params[:id])
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to root_path
  end
end
