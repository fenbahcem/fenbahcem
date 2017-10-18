Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do
    resources :unites
  end
  root to: 'ogrenci#index'
	
	get '/ogrenci/sinif5konuanlatimi/uniteler' => 'ogrenci#uniteler', sinif: 5	
	get '/ogrenci/sinif5konuanlatimi/uniteler/:id' => 'ogrenci#unite_konu', sinif: 5
	get '/ogrenci/sinif5konuanlatimi/uniteler/konu/:id' => 'ogrenci#konuanlatimi_incele'
  namespace :admin do
    resources :konuanlatimis
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
