Rails.application.routes.draw do
  get 'bookmarks/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/lists/new", to: "lists#new", as: :new_list
  post "lists", to: "lists#create"

  get "lists", to: "lists#index"
  get "lists/:id", to: "lists#show", as: :list


  get "lists/:list_id/bookmarks/new", to: "bookmarks#new", as: :new_list_bookmark
  post "lists/:list_id/bookmarks", to: "bookmarks#create", as: :list_bookmarks

  delete "bookmarks/:id", to: "bookmarks#destroy", as: :destroy

end
