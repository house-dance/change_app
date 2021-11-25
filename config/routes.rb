Rails.application.routes.draw do
  root to: 'changes#new'
  resources :changes, only: %i[new create show]
end
