Rails.application.routes.draw do
  get 'changes/index'
  resources :transactions
  get 'transactions/index'
  get 'transactions/new'
  post 'transactions/preview'

  resources :stocks
  get 'stocks/index'
  get 'stocks/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
