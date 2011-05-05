gem 'rdoc'
require 'rdoc/task'

namespace :sodium do
  task :init do
    rake 'db:migrate:reset'
    rake 'db:seed'
  end

  RDoc::Task.new "doc" do |rdoc|
    rdoc.title = "Sodium"
    rdoc.rdoc_dir = 'rdoc'
    rdoc.rdoc_files.include('app/**/*.rb')
    rdoc.rdoc_files.include('lib/**/*.rb')
    #rdoc.rdoc_files.include 'README'

    rdoc.options += [
        '--all',
        '-SHN',
        '-f', 'darkfish', # This is the important bit
        '-d', # Diagram
        '-i', 'app',
        '--op', 'rdoc'
    ]
  end

  def rake task
    Rake::Task[task].invoke
  end

end
