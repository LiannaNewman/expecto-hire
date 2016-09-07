Rails.application.routes.draw do
  devise_for :users

  get '/jobs' => 'jobs#index'
  get '/jobs/new' => 'jobs#new'
  post '/jobs' => 'jobs#create'
  get '/jobs/:id' => 'jobs#show'
  get '/jobs/:id/edit' => 'jobs#edit'
  patch '/jobs/:id' => 'jobs#update'
  delete '/jobs/:id' => 'jobs#destroy'

  get '/select_candidates' => 'select_candidates#index'
  get '/select_candidates/new' => 'select_candidates#new'
  post '/select_candidates' => 'select_candidates#create'
  get '/select_candidates/:id' => 'select_candidates#show'
  get '/select_candidates/:id/edit' => 'select_candidates#edit'
  patch '/select_candidates/:id' => 'select_candidates#update'
  delete '/select_candidates/:id' => 'select_candidates#destroy'

  get '/' => 'welcomes#index'
end
