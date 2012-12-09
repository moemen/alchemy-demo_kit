namespace :alchemy do
  namespace :demo_kit do

    desc "Install the Alchemy CMS demo kit."
    task :install do
      system("rails g alchemy:demo_kit")
    end

  end
end
