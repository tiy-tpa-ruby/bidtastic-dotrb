Rails.application.routes.draw do
  get 'favorites/create'

  get 'favorites/destroy'

  resources :items do
    resources :bids
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'session/new'
  root 'session#new'

# Omniauth routes
  get    '/auth/:provider'          => 'omniauth#auth',    as: :auth
  get    '/auth/:provider/callback' => 'session#create'
  get    '/auth/failure'            => 'session#failure'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

# bcrytp routes
  get '/signup' => 'admins#new'
  post '/admins' => 'admins#create'

  get  '/signin'   => 'admin_session#new'
  post '/signin'   => 'admin_session#create'
  get  '/signout'  => 'admin_session#destroy'

  mount Shrine::DownloadEndpoint => "/attachments"

  post 'favorites/:itemId'           => 'favorites#create'
  delete 'favorites/destroy/:itemId' => 'favorites#destroy'

end
