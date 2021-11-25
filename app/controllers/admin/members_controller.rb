class Admin::MembersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def show
    @member = Member.find(params[:id])
    @posts = @member.posts.page(params[:page]).reverse_order
  end

  def edit
  end

  def update
  end
end
