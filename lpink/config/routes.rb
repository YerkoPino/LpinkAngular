Rails.application.routes.draw do

  resources :proyectos
  get 'proyectos/index'

  get 'proyectos/show'

  get 'proyectos/new'

  get 'proyectos/edit'

  get 'proyectos/create'

  get 'proyectos/update'

  get 'proyectos/destroy'

  get 'sessions/new'

  get 'participantes/new'

  get 'participantes/edit'

  get 'participantes/show'

#  scope :api do
#    resources :principal, only: [:index], defaults: {format: :json}
#  end

  resources :actum
  resources :temas
  resources :elemento_dialogicos
  resources :participante_acta


  # Rutas para Principal

  get 'principal/index'
  get 'principal/usuariosProyecto'
  get 'principal/usuarios'
  get 'principal/usuariosActa'
  post 'principal/createAsistencia'

  # Rutas para acta

  post 'acta/create'
  get 'acta/index'
  get 'acta/cantidadActas'
  get 'acta/ultimaActa'


  # Rutas para dialogico

  get 'dialogico/index'

  # Rutas para tema

  get "participantes/new"  

  get "sign_up" => "participantes#new", :as => "sign_up" 
  get "log_in" => "sessions#new", :as => "log_in" 
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "proyectos_home" => "principal#principal", :as => "proyectos_home"  
  root :to => "sessions#new"  
  resources :participantes  
  resources :sessions

  #root 'principal#principal'

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