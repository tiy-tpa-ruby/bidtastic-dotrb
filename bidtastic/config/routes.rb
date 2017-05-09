Rails.application.routes.draw do
  get 'favorites/create'

  get 'favorites/destroy'

  resources :items

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'session/new'
  root 'session#new'

  get    '/auth/:provider'          => 'omniauth#auth',    as: :auth
  get    '/auth/:provider/callback' => 'session#create'
  get    '/auth/failure'            => 'session#failure'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  mount Shrine::DownloadEndpoint => "/attachments"

  post 'favorites/:itemId'           => 'favorites#create'
  delete 'favorites/destroy/:itemId' => 'favorites#destroy'

end
