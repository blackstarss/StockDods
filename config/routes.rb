Rails.application.routes.draw do
  
  #管理者用
  devise_for :admin,controllers:{
    sessions: 'admin/sessions'
  }
  #顧客用
  devise_for :member,controllers:{
    registrations: "member/registrations",
    sessions: 'member/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
