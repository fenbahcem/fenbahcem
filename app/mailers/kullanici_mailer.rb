class KullaniciMailer < ApplicationMailer
	default from: 'fenbahcem@gmail.com'
	 
	def onerivesikayet_email(adisoyadi, email, konu, aciklama)
		@adisoyadi = adisoyadi
		@email = email
		@konu = konu
		@aciklama = aciklama
		mail(to: "info.fenbahcem@gmail.com", subject: @konu)
  end
end
