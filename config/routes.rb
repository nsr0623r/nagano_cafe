Rails.application.routes.draw do
  # 管理者用ログイン
  devise_for :admin,  skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # 顧客用ログイン・新規登録
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  namespace :admin do
    resources :homes, only: [:top]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :update, :create]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:new, :show, :udpate]
    resources :order_details, only: [:update]
  end

  # 顧客用
  scope module: :public do
    root to: 'homes#top'
    get '/about'=> 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
    resources :address, only: [:index, :edit, :create, :update, :destroy]
    resource :customers do
      get '/customers/my_page' => 'customers#show', as: 'my_page'
      get '/customers/infomation/edit' => 'customers#edit', as: 'infomation_edit'
      patch '/customers/infomation' => 'customers#update', as: 'informa'
      get '/customers/unsubscribe' => 'customers#unsubscribe'
      patch '/customers/withdraw' => 'customers#withdraw'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
