Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  get '/companies/new' => 'companies#new'
  post '/companies' => 'companies#create'
  get '/companies/registered' => 'companies#show'
  get '/companies/:company_id/edit' => 'companies#edit'
  patch '/companies/:company_id' => 'companies#update'
  delete '/companies/company_id' => 'companies#destroy'

  get '/company/:company_id/jobs' => 'jobs#index'
  get '/company/:company_id/jobs/dashboard' => 'jobs#dashboard'
  get '/company/:company_id/jobs/dashboard2' => 'jobs#dashboard2'
  get '/company/:company_id/jobs/dashboard3' => 'jobs#dashboard3'
  get '/company/:company_id/jobs/new' => 'jobs#new'
  post '/company/:company_id/jobs' => 'jobs#create'
  get '/company/:company_id/jobs/:job_id' => 'jobs#show'
  get '/company/:company_id/jobs/:job_id/edit' => 'jobs#edit'
  patch '/company/:company_id/jobs/:job_id' => 'jobs#update'
  delete '/company/:company_id/jobs/:job_id' => 'jobs#destroy'
  get '/company/:company_id/jobs/:job_id/gen_rec' => 'jobs#gen_rec'
  post '/company/:company_id/jobs/:job_id/events' => 'jobs#events'

  get '/company/:company_id/jobs/:job_id/select_candidates' => 'select_candidates#index'
  get '/company/:company_id/jobs/:job_id/select_candidates/new' => 'select_candidates#new'
  post '/company/:company_id/jobs/:job_id/select_candidates' => 'select_candidates#create'
  get '/company/:company_id/jobs/:job_id/select_candidates/:candidate_id' => 'select_candidates#show'
  get '/company/:company_id/jobs/:job_id/select_candidates/:candidate_id/edit' => 'select_candidates#edit'
  patch '/company/:company_id/jobs/:job_id/select_candidates/:candidate_id' => 'select_candidates#update'
  delete '/company/:company_id/jobs/:job_id/select_candidates/:candidate_id' => 'select_candidates#destroy'

  get '/' => 'welcomes#index'
  get '/welcomes/about' => 'welcomes#about'
end
