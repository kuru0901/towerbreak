class CommentsController < ApplicationController
  def create
    comment = Comment.new(body: comment_params[:body], user_id: current_user.id, content_id: params[:content_id])
    if comment.save
      redirect_to content_path(comment.content), notice: 'コメントを投稿しました'
    else
      render 'content'
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(body: comment_params[:body])
      redirect_to content_path(comment.content), notice: 'コメントを更新しました'
    else
      render 'content'
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
