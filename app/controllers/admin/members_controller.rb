class Admin::MembersController < ApplicationController
  
  def show
    @member = Member.find(params[:id])
    @posts = @member.posts
  end
  
  def edit
  
  end
  
  def update
    
  end
end
