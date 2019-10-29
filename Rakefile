# frozen_string_literal: true

require 'rom/sql/rake_task'
require 'shellwords'

def location(route)
  path, line = route.app.source.source_location
  current = Pathname.new(Dir.pwd)
  second = Pathname.new(path)
  path = second.relative_path_from(current)
  [path, line].join(':')
end

task :environment do
  require File.expand_path('config/environment', __dir__)
end

namespace :grape do
  desc 'Condensed API Routes'
  task routes: :environment do
    fmt = '%- 10s %- 40s %- 50s %- 50s'
    Api::Root.routes.each do |route|
      puts format(fmt, route.request_method, route.path, location(route), route.description)
    end
  end
end

namespace :db do
  task setup: :environment do
  end

  namespace :structure do
    desc 'Dump database structure to db/structure.sql'
    task dump: :environment do
      if system('which pg_dump', out: File::NULL)
        system(%(pg_dump -s -x -O #{Shellwords.escape(ENV['DATABASE_URL'])} > db/structure.sql))
      end
    end
  end
end

Rake::Task['db:migrate'].enhance do
  Rake::Task['db:structure:dump'].invoke
end
