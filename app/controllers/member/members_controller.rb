class Member::MembersController < ApplicationController

  def show
    @member = current_member
    
    @posts = @member.posts

  end




  def edit

  end

  def update
    if current_member.update(member_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end


  private
  def member_params
    params.require(:member).permit(:name, :biography, :image)
  end

end
