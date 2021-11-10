Rails.application.routes.draw do
  

  
  #管理者用
  devise_for :admin,controllers:{
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get '/' => 'homes#top', as: '/'
    resources :members, only: [:show, :edit, :update]
    resources :posts, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  get 'about' => 'homes#about'
  root :to => "homes#top"
  
  #顧客用
  devise_for :member,controllers:{
    registrations: "member/registrations",
    sessions: 'member/sessions'
  }
  
  scope module: :public do
    resources :posts do
      resource :favorites , only: [:create , :destroy]
      resources :comments, only: [:create , :destroy]
    end
    
    resource :members do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    get 'members/mypage' => 'members#show', as: 'mypage'
    get 'members/unsubscribe' => 'members#unsubscribe', as: 'confirm_unsubscribe'
    patch 'members/withdraw' => 'members#withdraw', as: 'withdraw_member'
    get 'posts/genres' => 'posts#genres', as: 'genres'
    get 'posts/searchs' => 'posts#searchs', as: 'searchs'
    get 'posts/hashtags' => 'posts#hashtags', as: 'hashtags'
   
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
