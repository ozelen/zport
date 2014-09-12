Zport::Application.routes.draw do

  resources :certifications

  get 'cv'          => 'pages#cv',        as: :cv
  get 'contacts'    => 'pages#contacts',  as: :contacts

  resources :experiences
  get 'experiences/search'

  resources :people

  devise_for :people, path: 'auth',
             path_names: {
                 sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification',
                 unlock: 'unblock', registration: 'register', sign_up: 'signup' },
             controllers: {
                 registrations: 'registrations'
             }

  resources :skill_categories do
    resources :skills
  end

  resources :images

  resources :assignments do
    resources :experiences
  end

  resources :jobs

  resources :companies

  resources :projects

  resources :pages


  get 'skills' => 'pages#skills'

  get 'portfolio'   => 'pages#portfolio',  as: :portfolio
  get 'employment'  => 'pages#employment', as: :employment
  get 'education'   => 'pages#education',  as: :education

  get 'jobs/types/:type_name' => 'jobs#index', as: :jobs_type


  root 'pages#home'
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
