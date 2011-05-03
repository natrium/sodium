Sodium::Application.routes.draw do
  get "pages/contact"
  get "pages/privacy"
  get "pages/about"
  get "pages/help"
  get "pages/tos"
  get "pages/index"
  get "timeline/index"

  devise_scope :user do
    get "login",  :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
  end

  match "users/change_avatar", :to => "users#change_avatar"
  match "users/update_avatar", :to => "users#update_avatar"

  get '/:slug' => 'projects#show'
  match '/u/:name' => 'users#show'

  resources :projects
  resources :bubbles
#  resources :memberships

  devise_for :users


  match "follow_project" => "projects#follow", :as => 'follow_project'
  match "unfollow_project" => "projects#unfollow", :as => 'unfollow_project'
  match "projects/edit_member" => "projects#edit_member"

  root :to => "pages#index"
end
