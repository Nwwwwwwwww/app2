Rails.application.routes.draw do
  get '/' => 'homes#top'
  resources :bookers
end
