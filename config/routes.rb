Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  get '/company/:id/jobs' => 'jobs#index'
  get '/company/:id/jobs/dashboard' => 'jobs#dashboard'

  get '/company/:id/jobs/new' => 'jobs#new'
  post '/company/:id/jobs' => 'jobs#create'
  get '/company/:id/jobs/:id' => 'jobs#show'
  get '/company/:id/jobs/:id/edit' => 'jobs#edit'
  patch '/company/:id/jobs/:id' => 'jobs#update'
  delete '/company/:id/jobs/:id' => 'jobs#destroy'
  get '/company/:id/jobs/:id/gen_rec' => 'jobs#gen_rec'
  post '/company/:id/jobs/:id/events' => 'jobs#events'

  get '/company/:id/jobs/:id/select_candidates' => 'select_candidates#index'
  get '/company/:id/jobs/:id/select_candidates/new' => 'select_candidates#new'
  post '/company/:id/jobs/:id/select_candidates' => 'select_candidates#create'
  get '/company/:id/jobs/:id/select_candidates/:id' => 'select_candidates#show'
  get '/company/:id/jobs/:id/select_candidates/:id/edit' => 'select_candidates#edit'
  patch '/company/:id/jobs/:id/select_candidates/:id' => 'select_candidates#update'
  delete '/company/:id/jobs/:id/select_candidates/:id' => 'select_candidates#destroy'

  get '/' => 'welcomes#index'
end
