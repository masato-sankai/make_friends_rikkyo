Rails.application.routes.draw do

  get 'post/create'

  root 'home#top'
	get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
	resources :policies, only: :index

	resources :users, except: [:new, :create] do
		collection do
			get :departments_select
		end
	end
  resources :topic
  resources :posts

	namespace :admin do
		resources :users, :except => [:show]
		resources :faculties
		resources :departments
    resources :circles
    resources :topics
  end

end
