class Public::PostCommentsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    comment = PostComment.find(params[:id])
    comment.destroy
    redirect_to post_path(comment.post), notice: "コメントが削除されました。"
  end

  private

  def is_matching_login_user
    comment = PostComment.find(params[:id])
    unless comment.user == current_user
      redirect_to root_path, alert: "コメントの投稿者以外は削除できません。"
    end
  end

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
