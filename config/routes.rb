Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope module: :web do
    root "welcome#index"

    resource :session, only: [:new, :create, :destroy]
    resource :password, only: [:edit, :update]
    resource :remind_password, only: [:new, :create]

    resources :users, only: [:new, :index, :create] do
      member do
        get :confirm
      end
    end

    namespace :account do
      root 'welcome#index'
    end

    namespace :admin do
      root 'web/admin/welcome#index'
      resources :news, except: :show
    end
  end
end
