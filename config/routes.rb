Rails.application.routes.draw do
  # get 'users/new'


    # resources :users
    post 'user' => 'users#create'
    put 'user/profile' => 'users#update'
    delete 'user/delete' => 'users#destroy'
    # get '/user/signin' => 'users#signin'
    post '/user/signin' => 'users#signin'


post 'user/category/all' => 'category#show'
post 'user/category' => 'category#create'
delete 'user/category/delete' => 'category#destroy'
put 'user/category/edit' => 'category#update'

post 'user/task/create' => 'task#create'
delete 'user/task/delete' => 'task#destroy'
put 'user/task/edit' => 'task#update'
# post '/users/signup' => 'users#signup'
post 'user/category/task' => 'task#category_create'
post 'user/task' => 'task#show'
post 'user/task/move' => 'task#move'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
