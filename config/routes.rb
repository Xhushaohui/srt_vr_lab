Rails.application.routes.draw do
  devise_for :users

   root 'welcome#index'
   get '/neimenggu' =>'vrapps#neimenggu'
   get '/heart' =>'vrapps#heart'
   get '/split' =>'vrapps#split'
   get '/organicMolecule' =>'vrapps#organicMolecule'
   get '/halloween' =>'vrapps#halloween'
   
   resources :vrapps do
    resources :vrscenes do
      resources :sceneassets
    end
   end

   namespace :api, defaults: {format: 'json'} do
    namespace :v1 do 
      resources :vrapps, only: [:index, :create, :show, :update, :destroy]
    end
  end

end
