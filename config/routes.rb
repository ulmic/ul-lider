require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq', constraints: SidekiqConstraint.new

  mount Ckeditor::Engine => '/ckeditor'
  scope module: :web do
    root "welcome#index"

    resource :session, only: [:new, :create, :destroy]
    resource :password, only: [:edit, :update]
    resource :remind_password, only: [:new, :create]
    resources :news, only: [ :index, :show ]
    resources :events, only: [ :index, :show ]
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

    resources :users, only: [:new, :create] do
      member do
        get :confirm
        patch :update_status
      end
    end

    resources :fair_participants, only: [ :new, :index, :create ] do
      member do
        patch :update_status
      end
    end

    namespace :account do
      root 'welcome#index'
      resources :events, except: [ :show, :destroy, :index ]
    end

    namespace :admin do
      root 'welcome#index'
      resources :news, except: :show
      resources :users, except: :show do
        member do
          patch :push_to_second_stage
          patch :edit_average
        end
      end
      resources :admins, only: :index
      resources :pages, except: :show
      resources :fair_participants, except: :show
      resources :mailers, only: :index do
        collection do
          post :broadcast
          post :broadcast_all
        end
      end
    end
  end
  namespace :api do
    resources :news, only: [] do
      collection do
        get :last_news
        get :last_news_id
      end
    end
  end
  get '*unmatched_route', to: "web/errors#not_found" if Rails.env.production?
end
