Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'main#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'my_abilities' => 'user_abilities#edit'
  post 'my_abilities' => 'user_abilities#update', as: :update_abilities

  get 'my_preferences' => 'user_preferences#edit'
  post 'my_preferences' => 'user_preferences#update', as: :update_preferences

  get 'my_meetings' => 'meetings#index'
  get 'confirm_meeting/:meeting_id' => 'meetings#confirm_from_email', as: :confirm_meeting
  get 'reject_meeting/:meeting_id' => 'meetings#reject_from_email', as: :reject_meeting

  namespace :api do
    get 'with_ability' => 'users#with_ability'
    post 'set_meeting' => 'meetings#new'
    get 'waiting_for_confirmation' => 'meetings#waiting_for_confirmation'
    post 'confirm' => 'meetings#confirm'
    post 'reject' => 'meetings#reject'
  end

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
