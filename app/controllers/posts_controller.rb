class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, comments: :user)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author

    respond_to do |format|
      format.html
      format.json { render json: @post.comments }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      redirect_to user_path(current_user.id), notice: 'You created a post!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to user_path(@post.author), notice: 'You deleted a post!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author)
  end
end
