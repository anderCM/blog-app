class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    user = current_user || User.last

    @comment = Comment.create(comment_params)
    @comment.user = user
    @comment.post = @post

    if @comment.save
      respond_to do |format|
        format.json do
          render json: @comment
        end
        @comment.update_counter
        format.html do
          redirect_to user_post_path(current_user.id, @post.id), notice: 'You created a comment!'
        end
      end
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
    params.require(:comment).permit(:text)
  end
end
