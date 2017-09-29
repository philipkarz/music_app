class CommentsController < ApplicationController
  before_action :authorize, only: [:edit, :update, :create, :destroy]

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
    @comment = Comment.find(params[:id])
    @song = @comment.song
    unless @current_user == @comment.user
      flash[:danger] = "Don't try to put words in other's mouths"
      redirect_to song_path(@song) 
    end
  end

  def update
    @comment = Comment.find(params[:id])
    unless current_user == @comment.user
      flash[:danger] = "Don't try to put words in other's mouths"
      redirect_to song_path(@comment.song) 
    end
      @comment.comment = params[:comment][:comment]
      if @comment.update(comment_params)
        redirect_to song_path(@comment.song)
      else
        redirect_to edit_comment_path(@comment)
      end
    
  end

  def destroy
    @comment = Comment.find(params[:id])
    @song = @comment.song
    @comment.destroy
    redirect_to song_path(@song)
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
