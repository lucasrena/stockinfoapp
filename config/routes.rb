Rails.application.routes.draw do
  scope '/api' do
      resources :companies do
        get 'history', :on => :member
      end
  end
    
  get 'pages/welcome'
  root 'pages#welcome'
  
end
