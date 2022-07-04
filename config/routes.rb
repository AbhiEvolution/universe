Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  resources :articles
  resources :users
  resources :categories, except: [:destroy]
  resources :messages
  resources :courses
  resources :students
  get "teacher_info", to: "students#teacher_info"
  post 'course_enroll', to: 'student_courses#create'
end
