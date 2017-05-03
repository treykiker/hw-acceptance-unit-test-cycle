Rottenpotatoes::Application.routes.draw do
  resources :movies
  
  # map '/' to be a redirect to '/movies'
  resources :movies do
    get 'similar' => "movies#similar"
  end
end
