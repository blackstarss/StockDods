class ApplicationController < ActionController::Base
  
  def current_ability
    @current_ability ||= Ability.new(current_member)
  end

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: '画面を閲覧する権限がありません。'
  end
end
