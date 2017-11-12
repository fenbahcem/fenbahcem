namespace :delete do
    desc 'Duyuru 10 günden sonra silinecek'
    task :old_records => :environment do
      Admin::Duyuru.where('created_at < ?', 15.days.ago).each do |duyuru|
        duyuru.destroy
      end
  
    end
  end

# 0 8 * * * /bin/bash -l -c 'cd /my/project/releases/current && RAILS_ENV=production rake delete:old_records 2>&1'