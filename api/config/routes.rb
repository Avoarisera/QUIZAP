Rails.application.routes.draw do
  post "/sign-in" => "auth#sign_in"
  resources :questions
  resources :quizzes
  resources :results
  resources :users
end
