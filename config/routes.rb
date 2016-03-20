Rails.application.routes.draw do
  
  resource :session
  
  root "others#home"
  
  put "change-day/:id/:method" => "tracks#update", as: "day_change"
  get "users/:user_id/tracks/:id/filter-days/:filter" => "tracks#filtered_days", as: "filtered_days"
  
  resources :users do
    resources :tracks
  end
  
  resources :goals do
    resources :days
  end
  
end
