Simprest::Application.routes.draw do

  root :to => 'users#index'


  resources :users do
    resources :tickets
    constraints :format => :json do
      get 'dump' => 'users#dump', :on => :collection, :defaults => {:format => :json}
    end
    
    post :invite

  end
  
end
