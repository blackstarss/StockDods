class Member::PostsController < ApplicationController
  def new
    @post = Post.new
    @genres = Genre.all
  end

  def index
    @posts = Post.where(status: false)
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
    @post.save

    redirect_to post_path(@post.id), notice: "You have created post successfully."
    # else
    # @member = current_member
    # @posts = post.all
    # render :index
    # renderはredirect_toと異なりアクションを経由せず、そのままビューを出力するので、ビューで使う変数は、renderの前にそのアクション`で定義しないといけない。 ここでは@posts=post.allアクションを定義しておく必要
    # end
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_path(post.id)
    else
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
    @posts = @genre.posts.where(status: false)
    @genres = Genre.all
    @member = current_member
  end

  private

  def post_params
    params.require(:post).permit(:title, :article, :tags, :genre_id, :link, :status)
  end
end
