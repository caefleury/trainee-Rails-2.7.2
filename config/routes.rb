Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
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
