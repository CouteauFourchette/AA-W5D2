class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    if params[:parent_comment_id]
      @comment.parent_comment_id = params[:parent_comment_id]
    end
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.includes(votes: :user).find_by(id: params[:id])
    @reply_comment = Comment.new
  end

  def upvote
    @comment = Comment.find_by(id: params[:comment_id])
    @comment.upvote(current_user)
    redirect_to post_url(@comment.post)
  end

  def downvote
    @comment = Comment.find_by(id: params[:comment_id])
    @comment.downvote(current_user)
    redirect_to post_url(@comment.post)
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
