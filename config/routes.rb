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
    get 'top' => 'homes#top', as: 'homes_top'
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
      get 'my_page' => 'customers#show', as: 'my_page'
      get 'infomation/edit' => 'customers#edit', as: 'infomation_edit'
      patch 'infomation' => 'customers#update', as: 'informa'
      get 'unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
      patch 'withdraw' => 'customers#withdraw', as: 'withdraw'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
