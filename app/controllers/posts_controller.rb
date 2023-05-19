class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, comments: :user)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build(post_params)
    @post.save ? (redirect_to @post) : (render :new)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author)
  end
end
