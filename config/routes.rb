Rails.application.routes.draw do
  resources :areas, only: :show, param: :area_type
  resources :orders
end
