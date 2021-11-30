class Member::PostsController < ApplicationController

  before_action :ensure_correct_member, { only: [:edit, :update, :destroy] }

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def index
    from = Time.now.at_beginning_of_day
    to = (from + 6.day).at_end_of_day
    posts = Post.includes(:favorites).
      sort {|a,b|
        b.favorites.includes(:favorites).where(created_at: from...to).size <=>
        a.favorites.includes(:favorites).where(created_at: from...to).size
      }
    @posts = Kaminari.paginate_array(posts).page(params[:page])
    @member = current_member
    @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
    @member = @post.member
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.member = current_member
    # 投稿者とログインユーザをひも付ける
    if @post.save
      redirect_to post_path(@post.id), notice: "You have created post successfully."
    else
      @genres = Genre.all
      render "new"
    end
  end

  def edit
    @genres = Genre.all
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_path(post.id)
    else
      @post = Post.find(params[:id])
      @genres = Genre.all
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to member_path(current_member)
  end

  def genre
    @genre = Genre.find(params[:id])
    @posts = @genre.posts.where(status: false).page(params[:page]).reverse_order
    @genres = Genre.all
    @member = current_member
  end

  private

  def post_params
    params.require(:post).permit(:title, :article, :tags, :genre_id, :link, :status)
  end

  def ensure_correct_member
    @post = Post.find(params[:id])
    unless @post.member == current_member
      redirect_to posts_path
    end
  end
end
