Rails.application.routes.draw do
	mount Ckeditor::Engine => '/ckeditor'
  
	namespace :admin do
 		resources :materyals, except: :index
  end

  namespace :admin do
    resources :projes
  end
  
	namespace :admin do
    resources :denemes
  end
  
  
	namespace :admin do
    resources :unites
  end

	# Anasayfa
  root to: 'ogrenci#index'
	
	# Konu Anlatimi 5-6-7-8 sinif
	get '/ogrenci/sinif5konuanlatimi/uniteler' => 'ogrenci#uniteler', sinif: 5	
	get '/ogrenci/sinif5konuanlatimi/uniteler/:id' => 'ogrenci#unite_konu', sinif: 5
	get '/ogrenci/sinif5konuanlatimi/uniteler/konu/:id' => 'ogrenci#konuanlatimi_incele', sinif: 5
 	
	get '/ogrenci/sinif6konuanlatimi/uniteler' => 'ogrenci#uniteler', sinif: 6	
	get '/ogrenci/sinif6konuanlatimi/uniteler/:id' => 'ogrenci#unite_konu', sinif: 6
	get '/ogrenci/sinif6konuanlatimi/uniteler/konu/:id' => 'ogrenci#konuanlatimi_incele', sinif:6
		
	get '/ogrenci/sinif7konuanlatimi/uniteler' => 'ogrenci#uniteler', sinif: 7	
	get '/ogrenci/sinif7konuanlatimi/uniteler/:id' => 'ogrenci#unite_konu', sinif: 7
	get '/ogrenci/sinif7konuanlatimi/uniteler/konu/:id' => 'ogrenci#konuanlatimi_incele', sinif:7
	
	get '/ogrenci/sinif8konuanlatimi/uniteler' => 'ogrenci#uniteler', sinif: 8	
	get '/ogrenci/sinif8konuanlatimi/uniteler/:id' => 'ogrenci#unite_konu', sinif: 8
	get '/ogrenci/sinif8konuanlatimi/uniteler/konu/:id' => 'ogrenci#konuanlatimi_incele', sinif:8

	# Deneme 5-6-7-8 sinif
	get '/ogrenci/sinif5deneme/uniteler' => 'ogrenci#deneme_uniteler', sinif: 5
	get '/ogrenci/sinif6deneme/uniteler' => 'ogrenci#deneme_uniteler', sinif: 6	
	get '/ogrenci/sinif7deneme/uniteler' => 'ogrenci#deneme_uniteler', sinif: 7	
	get '/ogrenci/sinif8deneme/uniteler' => 'ogrenci#deneme_uniteler', sinif: 8	

	# Bilim Fuari
	get '/bilimfuari' => 'ogrenci#bilimfuari'
	get '/bilimfuari/proje/:id' => 'ogrenci#proje_show'	
	namespace :admin do
    resources :konuanlatimis
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
