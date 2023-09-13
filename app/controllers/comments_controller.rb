class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    authorize @comment
    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path }
      else
        format.html { redirect_to root_path, status: :unprocessable_entity }
      end
      format.json
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
