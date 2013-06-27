namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create(username: "Sakaye",
                        email: "sakaye87@gmail.com",
                        password: "foobar",
                        password_confirmation: "foobar")
    admin.toggle!(:admin)
  end
end