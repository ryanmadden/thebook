Rails.application.routes.draw do
  
  resources :rushees do
    member do
      put 'like', to: "rushees#vote"
      put 'unlike', to: "rushees#unvote"
      match 'offer', to: "rushees#offered", via: [:get, :post]
      match 'unoffer', to: "rushees#unoffered", via: [:get, :post]
      match 'drop', to: "rushees#dropped", via: [:get, :post]
      match 'undrop', to: "rushees#undropped", via: [:get, :post]
      match 'table', to: "rushees#tabled", via: [:get, :post]
      match 'untable', to: "rushees#untabled", via: [:get, :post]
      match 'reject', to: "rushees#rejected", via: [:get, :post]
      match 'unreject', to: "rushees#unrejected", via: [:get, :post]
    end
    resources :comments do
      member do
        put 'post', to: "comments#create"
        put 'like', to: "comments#vote"
        put 'unlike', to: "comments#unvote"
        put 'delete', to: "comments#destroy"
      end
    end
  end

  match 'stats' => 'rushees#stats', via: [:get, :post]

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  root "pages#home"
  get "top" => "rushees#top"
  get "recent" => "rushees#recent"
  get "views" => "rushees#views"
  get "comments" => "rushees#comments"

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
