class Member::CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    @comment.member_id = current_member.id
    @comment.save
    # 非同期通信のためredirect_to削除
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    comment.destroy
    # 非同期通信のためredirect_to削除
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
