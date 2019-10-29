# frozen_string_literal: true

require File.expand_path('config/environment', __dir__)

def location(route)
  path, line = route.app.source.source_location
  current = Pathname.new(Dir.pwd)
  second = Pathname.new(path)
  path = second.relative_path_from(current)
  [path, line].join(':')
end

namespace :grape do
  desc 'Condensed API Routes'
  task :routes do
    fmt = '%- 10s %- 40s %- 50s %- 50s'
    DryGrape.routes.each do |route|
      puts format(fmt, route.request_method, route.path, location(route), route.description)
    end
  end
end
