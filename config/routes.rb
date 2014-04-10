SkillMatrix::Application.routes.draw do
  # TODO - Add more restrictions and Clean Me
  devise_for :users, :controllers => {:sessions => "sessions",
                                      :registrations => "registrations"}
  resources :users, :only => [:index, :edit, :update, :destroy]
  resources :profiles, :only => [:show]
  resources :ratings, :only => [:update, :create, :index]

  resources :surveys do
    resources :attempts
  end

  get "admin_surveys", :to => 'surveys#admin'
  get "survey_submissions", :to => 'surveys#submissions'
  post "compose_email", :to => "users#compose_email"

  get "static_pages/home"
  get "static_pages/survey_builder"
  get "users/sign_in", :to => 'user#sign_in', :as => :sign_in

  root "static_pages#home"

end
