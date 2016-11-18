desc "This task is called by the Heroku scheduler add-on and deletes expired slides"

task :tidy_slides => :environment do
  puts "cleaning slides..."
  Slide.where("expiration_date < ?", Date.today).delete_all
  puts "done."
end
