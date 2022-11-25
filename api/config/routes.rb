Rails.application.routes.draw do
  post "/sign-in" => "auth#sign_in"
  get 'results/show'
  get 'results/create'
  get 'results/update'
  get 'results/destroy'
  get 'answer_choices/create'
  get 'answer_choices/update'
  get 'answer_choices/destroy'
  get 'questions/create'
  get 'questions/update'
  get 'questions/destroy'
  get 'quizzes/create'
  get 'quizzes/update'
  get 'quizzes/destroy'
  get 'users/create'
  get 'users/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
