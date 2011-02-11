namespace :sodium do
  task :init do
    rake 'db:migrate:reset'
    rake 'db:seed'
  end

  def rake task
    Rake::Task[task].invoke
  end
end
