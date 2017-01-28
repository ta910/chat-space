Rails.application.routes.draw do
  devise_for :users
  root 'chats#index'
  get 'groups/new'    =>     'groups#new'
  post 'groups'        =>     'groups#create'
end
