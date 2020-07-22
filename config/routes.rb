Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about', as:'about'
  get 'search' => 'searches#search'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :index, :update] do
    get 'follows' => 'users#follow_users'
    get 'followers' => 'users#follower_users'
  end
  resources :relationships, only: [:create, :destroy] 
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
end


=begin
	Prefix Verb   URI Pattern                                                                              Controller#Action
                     root GET    /                                                                                        homes#top
                    about GET    /home/about(.:format)                                                                    homes#about
                   search GET    /search(.:format)                                                                        searches#search
         new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
             user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
     destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
        new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
       edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
            user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
                          PUT    /users/password(.:format)                                                                devise/passwords#update
                          POST   /users/password(.:format)                                                                devise/passwords#create
 cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
    new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
   edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
        user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
                          PUT    /users(.:format)                                                                         devise/registrations#update
                          DELETE /users(.:format)                                                                         devise/registrations#destroy
                          POST   /users(.:format)                                                                         devise/registrations#create
             user_follows GET    /users/:user_id/follows(.:format)                                                        users#follow_users
           user_followers GET    /users/:user_id/followers(.:format)                                                      users#follower_users
                    users GET    /users(.:format)                                                                         users#index
                edit_user GET    /users/:id/edit(.:format)                                                                users#edit
                     user GET    /users/:id(.:format)                                                                     users#show
                          PATCH  /users/:id(.:format)                                                                     users#update
                          PUT    /users/:id(.:format)                                                                     users#update
            relationships POST   /relationships(.:format)                                                                 relationships#create
             relationship DELETE /relationships/:id(.:format)                                                             relationships#destroy
           book_favorites DELETE /books/:book_id/favorites(.:format)                                                      favorites#destroy
                          POST   /books/:book_id/favorites(.:format)                                                      favorites#create
       book_post_comments POST   /books/:book_id/post_comments(.:format)                                                  post_comments#create
        book_post_comment DELETE /books/:book_id/post_comments/:id(.:format)                                              post_comments#destroy
                    books GET    /books(.:format)                                                                         books#index
                          POST   /books(.:format)                                                                         books#create
                edit_book GET    /books/:id/edit(.:format)                                                                books#edit
                     book GET    /books/:id(.:format)                                                                     books#show
                          PATCH  /books/:id(.:format)                                                                     books#update
                          PUT    /books/:id(.:format)                                                                     books#update
                          DELETE /books/:id(.:format)                                                                     books#destroy
               refile_app        /attachments                                                                             #<Refile::App app_file="/home/vagrant/.rbenv/versions/2.5.7/lib/ruby/gems/2.5.0/bundler/gems/refile-46b4178654e6/lib/refile/app.rb">
       rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
[vagrant@localhost Bookers]$ 

=end
