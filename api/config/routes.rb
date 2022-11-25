Rails.application.routes.draw do
  post "/sign-in" => "auth#sign_in"
  resources :answer_choices
  resources :questions
  resources :quizzes
  resources :results
  resources :users
end
