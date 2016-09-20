Rails.application.routes.draw do
  devise_for :users

  get '/jobs' => 'jobs#index'
  get '/jobs/dashboard' => 'jobs#dashboard'

  get '/jobs/new' => 'jobs#new'
  post '/jobs' => 'jobs#create'
  get '/jobs/:id' => 'jobs#show'
  get '/jobs/:id/edit' => 'jobs#edit'
  patch '/jobs/:id' => 'jobs#update'
  delete '/jobs/:id' => 'jobs#destroy'

  get '/jobs/:id/select_candidates' => 'select_candidates#index'
  get '/jobs/:id/select_candidates/new' => 'select_candidates#new'
  get 'jobs/:id/select_candidates/gen_rec' => 'select_candidates#generate_recommendation'
  post '/jobs/:id/select_candidates' => 'select_candidates#create'
  get '/jobs/:id/select_candidates/:id' => 'select_candidates#show'
  get '/jobs/:id/select_candidates/:id/edit' => 'select_candidates#edit'
  patch '/jobs/:id/select_candidates' => 'select_candidates#update'
  delete '/jobs/:id/select_candidates/:id' => 'select_candidates#destroy'

  get '/' => 'welcomes#index'
end
