namespace :texts do
  desc "check texts"
  task :check_texts => :environment  do 
    Text.all.each do |text|
      text.send_all_texts
    end
  end
end

