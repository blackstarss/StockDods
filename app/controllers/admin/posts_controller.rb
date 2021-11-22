class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @member = @post.member
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def update
    @member = Member.find(params[:id])
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to admin_member_path(@member)
  end

  private

  def post_params
    params.require(:post).permit(:status)
  end
end
