Rails.application.routes.draw do
  get 'sources/_new'

  get 'helplinks/_new'

  get 'temas/_new'

  get 'home' => 'welcome#index'
  # post 'home' => 'welcome#index'
  post '/' => 'welcome#index'

  get 'sessions/new'
  get 'users' => 'users#index'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#_new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'edit' => 'users#edit'
  
  resources :users
  mount Ckeditor::Engine => '/ckeditor'
  resources :courses
  resources :courses do
    resources :lessons
  end
  resources :courses do
    resources :temas
  end
  resources :courses do
    resources :helplinks
  end
  resources :courses do
    resources :sources
  end
  root "welcome#index"

  get '*path' => redirect('/')

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

