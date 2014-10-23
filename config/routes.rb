Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope module: :web do
    root "welcome#index"

    resource :session, only: [:new, :create, :destroy]
    resource :password, only: [:edit, :update]
    resource :remind_password, only: [:new, :create]
    resources :news, only: [ :index, :show ]
    resources :pages, only: [] do
      collection do
        get "/:slug" => "pages#show"
      end
    end
    resource :errors, only: [] do
      collection do
        get :not_found
        get :forbidden
      end
    end

    resources :users, only: [:new, :index, :create] do
      member do
        get :confirm
      end
    end

    namespace :account do
      root 'welcome#index'
    end

    namespace :admin do
      root 'welcome#index'
      resources :news, except: :show
      resources :users, except: :show
      resources :admins, only: :index
      resources :pages, except: :show
    end
  end
  namespace :api do
    resources :news, only: [] do
      collection do
        get :last_news
      end
    end
  end
end
