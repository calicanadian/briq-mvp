Rails.application.routes.draw do
  root 'briqs#index'

  resources :briqs do
    resources :records, only: [:index, :show, :destroy] do
      collection do
        get :import_new
        post :import
      end
    end
  end

  mount ActionCable.server, at: '/cable'
end
