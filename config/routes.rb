Rails.application.routes.draw do
  # 8.1
  # anidando agregamos:
   # a resources :playlists , agregar: 
                     # do
   # post 'songs', to: 'songs#create' (creamos ruta songs anidada)
   # end
  
  resources :playlists do
    post 'songs', to: 'songs#create'

    #10
    
  end
  delete 'songs/:id', to: 'songs#destroy', as:'delete_song'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
