MyWedding::Application.routes.draw do

#  get "guest/new"
#  get "guest/edit"
#  get "guest/show"
#  get "guest/update"
#  get "guest/destroy"
  root 'static_pages#home'
  
  resources :guests, only: [:show, :new, :create, :edit, :update, :destroy]
  
  match '/invite', to: 'static_pages#invite', via: 'get'
  match '/story', to: 'static_pages#story', via: 'get'
  match '/wish', to: 'static_pages#wish', via: 'get'
  match '/guests/wish', to: 'guests#show', via: 'get'
  #get "static_pages/home"
  #get "static_pages/story"
  #get "static_pages/invite"
  #get "static_pages/wish"
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
