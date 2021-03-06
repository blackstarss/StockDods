class Admin::PostsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @posts = Post.all.page(params[:page]).reverse_order
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
    @post = Post.find(params[:id])
    @member = @post.member
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to admin_member_path(@member)
    else
      @post = Post.find(params[:id])
      @genres = Genre.all
      render "edit"
    end
  end

  private

  def post_params
    params.require(:post).permit(:status)
  end
end
