Refinery::Application.routes.draw do
  resources :proposals, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :proposals, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end