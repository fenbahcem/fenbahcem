Rails.application.routes.draw do
	mount Ckeditor::Engine => '/ckeditor'
  
	get '/admin' => 'admin#index'
  
	namespace :admin do
 		resources :materyals #, except: :index
  end
	
	get '/admin/yapraktest' => 'admin/materyals#index', materyaltur: 1, title: 'Yaprak Test'
	get '/admin/denemesinavlari' => 'admin/materyals#index', materyaltur: 2, title: 'Deneme Sınavları'
	get '/admin/yazililar' => 'admin/materyals#index', materyaltur: 3, title: 'Yazılılar'
	get '/admin/calismakagitlari' => 'admin/materyals#index', materyaltur: 4, title: 'Çalışma Kağıtları'
	get '/admin/cikmissinavsorulari' => 'admin/materyals#index', materyaltur: 5, title: 'Çıkmış Sınav Soruları'
	get '/admin/kazanimlar' => 'admin/materyals#index', materyaltur: 6, title: 'Kazanımlar'
	get '/admin/yillikplan' => 'admin/materyals#index', materyaltur: 7, title: 'Yıllık Plan'
	get '/admin/gunlukplan' => 'admin/materyals#index', materyaltur: 8, title: 'Günlük Plan'
	get '/admin/bep' => 'admin/materyals#index', materyaltur: 9, title: 'BEP'

  namespace :admin do
    resources :projes
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

	# Yaprak Testler 5-6-7-8 sinif
	get '/ogrenci/sinif5yapraktest/uniteler' => 'ogrenci#yapraktest', sinif: 5, materyaltur: 1
	get '/ogrenci/sinif6yapraktest/uniteler' => 'ogrenci#yapraktest', sinif: 6, materyaltur: 1	
	get '/ogrenci/sinif7yapraktest/uniteler' => 'ogrenci#yapraktest', sinif: 7, materyaltur: 1
	get '/ogrenci/sinif8yapraktest/uniteler' => 'ogrenci#yapraktest', sinif: 8, materyaltur: 1	
	
	# Deneme 5-6-7-8 sinif
	get '/ogrenci/sinif5deneme/uniteler' => 'ogrenci#deneme', sinif: 5, materyaltur: 2
	get '/ogrenci/sinif6deneme/uniteler' => 'ogrenci#deneme', sinif: 6, materyaltur: 2
	get '/ogrenci/sinif7deneme/uniteler' => 'ogrenci#deneme', sinif: 7, materyaltur: 2	
	get '/ogrenci/sinif8deneme/uniteler' => 'ogrenci#deneme', sinif: 8, materyaltur: 2	

	# Yazililar 5-6-7-8 sinif
	get '/ogrenci/sinif5yazili/uniteler' => 'ogrenci#yazili', sinif: 5, materyaltur: 3
	get '/ogrenci/sinif6yazili/uniteler' => 'ogrenci#yazili', sinif: 6, materyaltur: 3	
	get '/ogrenci/sinif7yazili/uniteler' => 'ogrenci#yazili', sinif: 7, materyaltur: 3
	get '/ogrenci/sinif8yazili/uniteler' => 'ogrenci#yazili', sinif: 8, materyaltur: 3	
	
	# Calisma Kagitlari 5-6-7-8 sinif
	get '/ogrenci/sinif5calismakagitlari/uniteler' => 'ogrenci#calismakagitlari', sinif: 5, materyaltur: 4
	get '/ogrenci/sinif6calismakagitlari/uniteler' => 'ogrenci#calismakagitlari', sinif: 6, materyaltur: 4	
	get '/ogrenci/sinif7calismakagitlari/uniteler' => 'ogrenci#calismakagitlari', sinif: 7, materyaltur: 4
	get '/ogrenci/sinif8calismakagitlari/uniteler' => 'ogrenci#calismakagitlari', sinif: 8, materyaltur: 4	
	
	# Cikmis Sinav Sorulari 5-6-7-8 sinif
	get '/ogrenci/sinif5cikmissinavsorulari/uniteler' => 'ogrenci#cikmissinavsorulari', sinif: 5, materyaltur: 5
	get '/ogrenci/sinif6cikmissinavsorulari/uniteler' => 'ogrenci#cikmissinavsorulari', sinif: 6, materyaltur: 5	
	get '/ogrenci/sinif7cikmissinavsorulari/uniteler' => 'ogrenci#cikmissinavsorulari', sinif: 7, materyaltur: 5
	get '/ogrenci/sinif8cikmissinavsorulari/uniteler' => 'ogrenci#cikmissinavsorulari', sinif: 8, materyaltur: 5	
	
	# Kazanimlar 5-6-7-8 sinif
	get '/ogrenci/sinif5kazanimlar/uniteler' => 'ogrenci#kazanimlar', sinif: 5, materyaltur: 6
	get '/ogrenci/sinif6kazanimlar/uniteler' => 'ogrenci#kazanimlar', sinif: 6, materyaltur: 6	
	get '/ogrenci/sinif7kazanimlar/uniteler' => 'ogrenci#kazanimlar', sinif: 7, materyaltur: 6
	get '/ogrenci/sinif8kazanimlar/uniteler' => 'ogrenci#kazanimlar', sinif: 8, materyaltur: 6	
	
	# Yillik Plan 5-6-7-8 sinif
	get '/ogrenci/sinif5yillikplan/uniteler' => 'ogrenci#yillikplan', sinif: 5, materyaltur: 7
	get '/ogrenci/sinif6yillikplan/uniteler' => 'ogrenci#yillikplan', sinif: 6, materyaltur: 7	
	get '/ogrenci/sinif7yillikplan/uniteler' => 'ogrenci#yillikplan', sinif: 7, materyaltur: 7
	get '/ogrenci/sinif8yillikplan/uniteler' => 'ogrenci#yillikplan', sinif: 8, materyaltur: 7	
	
	# Gunluk Plan 5-6-7-8 sinif
	get '/ogrenci/sinif5gunlukplan/uniteler' => 'ogrenci#gunlukplan', sinif: 5, materyaltur: 8
	get '/ogrenci/sinif6gunlukplan/uniteler' => 'ogrenci#gunlukplan', sinif: 6, materyaltur: 8	
	get '/ogrenci/sinif7gunlukplan/uniteler' => 'ogrenci#gunlukplan', sinif: 7, materyaltur: 8
	get '/ogrenci/sinif8gunlukplan/uniteler' => 'ogrenci#gunlukplan', sinif: 8, materyaltur: 8	
	
	# BEP 5-6-7-8 sinif
	get '/ogrenci/sinif5BEP/uniteler' => 'ogrenci#bep', sinif: 5, materyaltur: 9
	get '/ogrenci/sinif6BEP/uniteler' => 'ogrenci#bep', sinif: 6, materyaltur: 9	
	get '/ogrenci/sinif7BEP/uniteler' => 'ogrenci#bep', sinif: 7, materyaltur: 9
	get '/ogrenci/sinif8BEP/uniteler' => 'ogrenci#bep', sinif: 8, materyaltur: 9	
	
	# Bilim Fuari
	get '/bilimfuari' => 'ogrenci#bilimfuari'
	get '/bilimfuari/proje/:id' => 'ogrenci#proje_show'	
	namespace :admin do
    resources :konuanlatimis
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
