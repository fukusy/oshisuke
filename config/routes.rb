Rails.application.routes.draw do
  get 'searchs/search'
  namespace :user do
    get 'tags/show'
  end
  get 'search' => 'searchs#search'

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords,], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions',
    registrations: 'user/registrations',
    # Twitter API認証用
    :omniauth_callbacks => 'user/omniauth_callbacks',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   namespace :admin do
     get '/' => 'homes#top'
     resources :contacts, only: [:index]
     resources :events, except: [:new] do
        resources :comments, only: [:create, :edit, :update, :destroy]
     end
     
     resources :tags, except: [ :show, :new]
   end

   scope module: :user do
     get '/' => 'homes#top'
     get '/attention' => 'homes#attention'
     resources :tags, only: [:show]
     resources :users, except: [:destroy] do
       resource :relationship_users, only: [:create, :destroy]
     get 'followings' => 'relationship_users#followings', as: 'followings'
     get 'followers' => 'relationship_users#followers', as: 'followers'
     end

     get 'contacts/complete' => 'contacts#complete'
     resources :contacts, only: [:new, :create]
     resources :events, except: [:new] do
       resources :comments, only: [:create, :edit, :update, :destroy]
       resources :relationship_events, only: [:show, :create]
       resources :relationship_tags, only: [:create, :destroy]
     end

   end

end
