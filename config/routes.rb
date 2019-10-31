Rails.application.routes.draw do
  root "users#index"

  resources :users, except: %i[destroy] do
    resources :document_templates do
      resource :render, only: [:create]
    end
  end
end
