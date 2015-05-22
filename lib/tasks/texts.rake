#rake task to check all texts in DB. Whenever runs this every minute locally.  Heroku scheduler every 10 minutes
namespace :texts do
  desc "check texts"
  task :check_texts => :environment  do 
    Text.all.each do |text|
      text.send_all_texts
    end
  end
end

