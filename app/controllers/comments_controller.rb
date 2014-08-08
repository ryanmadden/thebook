class CommentsController < ApplicationController
  def create
    @rushee = Rushee.find(params[:rushee_id])
    @rushee.comments.create(new_comment_params) do |comment|
      comment.user = current_user
    end
    respond_to do |format|
      format.html {redirect_to rushee_path(@rushee)}
    end
  end

  def destroy
    @rushee = Rushee.find(params[:rushee_id])
    @comment = @rushee.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to rushee_path(@rushee)}
    end
  end

  def vote
    @rushee = Rushee.find(params[:rushee_id])
    @comment = @rushee.comments.find(params[:id])
    @comment.liked_by current_user

    respond_to do |format|
        format.html {redirect_to @rushee}
    end
  end

  def unvote
    @rushee = Rushee.find(params[:rushee_id])
    @comment = @rushee.comments.find(params[:id])
    @comment.unliked_by current_user

    respond_to do |format|
        format.html {redirect_to @rushee}
    end
  end

  private

  def new_comment_params
    params.require(:comment).permit(:body)
  end

end