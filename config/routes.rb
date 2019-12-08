Rails.application.routes.draw do
  # namespace :api do
  #     resources :companies
  # end
    
  get 'pages/welcome'
  root 'pages#welcome'

  get 'api/companies', controller: :companies, action: :index


end
