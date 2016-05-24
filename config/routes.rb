Rails.application.routes.draw do
  resources :timers
  resources :pomodoros
  resources :tasks
  devise_for :users
  resources :users

  post 'set_current' => 'tasks#set_current'
  root to: 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
