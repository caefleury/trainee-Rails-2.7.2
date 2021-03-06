Rails.application.routes.draw do
  devise_for :users, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      scope 'users' do
        get 'login', to: 'users#login'
        get 'logout', to: 'users#logout'
      end
      scope 'user_products'do
        get 'index', to: 'user_products#index'
        get 'show/:id', to: 'user_products#show'
        post 'create', to: 'user_products#create'
        patch 'update', to: 'user_products#update' #update/:id
        delete 'delete/:id', to: 'user_products#delete'
      end
      scope 'products' do
        get 'index', to: 'products#index'
        get 'show/:id', to: 'products#show'
        post 'create', to: 'products#create'
        patch 'update', to: 'products#update' #update/:id
        delete 'delete/:id', to: 'products#delete'
      end
      scope 'tags' do
        get 'index', to: 'tags#index'
        get 'show/:id', to: 'tags#show'
        post 'create', to: 'tags#create'
        patch 'update', to: 'tags#update' #update/:id
        delete 'delete/:id', to: 'tags#delete'
      end
    end
  end

end
