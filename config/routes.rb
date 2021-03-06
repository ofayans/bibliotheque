Rails.application.routes.draw do
  devise_for :operators
  resources :runs

  resources :rundockerservers

  resources :images

  resources :dockerservers

  resources :logservers

#  get 'docker_info/get_docker_images'

  resources :rhcbranches

  resources :brokertypes

  get 'runs/:id/logs' => 'logs#index', :as => 'log_viewer'

  #(.html) is added to the route below to force the page to be shown as .html, as the
  #console log controller creates an html file out of the original log file
  get 'logs/console/:console_file(.html)' => 'logs#display_console_logs'

  get 'logs/html_log/:file' => 'logs#display_html_logs'

  get 'imageurls/:docker_id' => 'docker_info#get_docker_images'

  get 'logs' => 'logs#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'runs#new'
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
