Rails.application.routes.draw do

  resources :dashboards

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  root 'welcome#index'

end
