Rails.application.routes.draw do
  # get 'users/new'


    # resources :users
    post 'user' => 'users#create'
    put 'user/profile' => 'users#update'
    delete 'user/delete' => 'users#destroy'
    # get '/user/signin' => 'users#signin'
    post '/user/signin' => 'users#signin'

post 'user/category' => 'category#create'
delete 'user/category/delete' => 'category#destroy'
put 'user/category/edit' => 'category#update'

post 'user/category/task' => 'task#create'
delete 'user/category/task/delete' => 'task#destroy'
put 'user/category/task/edit' => 'task#update'
# post '/users/signup' => 'users#signup'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
