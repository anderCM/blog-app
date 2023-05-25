class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      @comment.update_counter
      redirect_to user_post_path(current_user.id, @post.id), notice: 'You created a comment!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    redirect_to user_post_path(@comment.post.author, @comment.post), notice: 'You deleted a comment!'
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id, :user)
  end
end
