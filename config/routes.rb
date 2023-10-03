Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, controllers: { sessions: 'sessions'},
             path_names: { sign_in: :log_in, sign_out: :log_out }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      resources :gists, only: :create
    end
  end

  namespace :admin do
    resources :gists, only: :index

    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
