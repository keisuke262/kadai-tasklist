Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  #resourcesによって7つのRESTfulなルーティングが自動生成される
  resources :tasks
end
