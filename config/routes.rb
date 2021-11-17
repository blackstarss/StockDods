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

  #利用者用

  get 'about' => 'homes#about'
  root :to => "homes#top"

  devise_for :member,controllers:{
    registrations: "member/registrations",
    sessions: 'member/sessions'
  }

  scope module: :member do
    resources :posts do
      resource :favorites , only: [:create , :destroy]
      resources :comments, only: [:create , :destroy]
    end

    resources :members,only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    get 'posts/genre/:id' => 'posts#genre', as: 'genre'

    get 'posts/hashtags' => 'posts#hashtag', as: 'hashtag'
    get '/hashtags/hashtag/:name' => 'hashtags#hashtag'
    get '/posts/hashtag' => 'posts#hashtag'

  end

  get '/search', to: 'searches#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
