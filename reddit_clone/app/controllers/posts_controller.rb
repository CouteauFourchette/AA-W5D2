class PostsController < ApplicationController
  def new
    @post = Post.new
    @subs = Sub.all
    render :new
  end

  def create
    @post = Post.create(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to subs_url
    else
      @subs = Sub.all
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @subs = Sub.all
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to subs_url
    else
      @subs = Sub.all
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.includes(comments: [:author, :votes], votes: :user).find_by(id: params[:id])
  end

  def upvote
    @post = Post.find(params[:post_id])
    @post.upvote(current_user)
    redirect_to subs_url
  end

  def downvote
    @post = Post.find(params[:post_id])
    @post.downvote(current_user)
    redirect_to subs_url
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
