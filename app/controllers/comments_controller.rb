class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    if logged_in?
      @comment = Comment.new
      @comment.comment = params[:comment][:comment]
      @song = Song.find(params[:comment][:song_id])
      @comment.song = @song
      @comment.user = current_user
      if @comment.save
        redirect_to song_path(@song)
      else
        flash[:danger] = "comment could not be saved"
        redirect_to song_path
      end
    else 
      flash[:danger] = "must be logged in to do that"
      redirect_to new_session_path  
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @song = @comment.song
    @comment.destroy
    redirect_to song_path(@song)
  end
end
