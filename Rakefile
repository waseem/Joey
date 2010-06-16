require 'rubygems'
require 'rake'
require 'echoe'
require 'lib/joey/version'

Echoe.new('joey') do |p|  
  p.version         = Joey::VERSION::STRING
  p.description     = "Object wrappers for nodes in the Facebook OpenGraph"
  p.url             = "http://github.com/waseem/joey"
  p.author          = "Waseem Ahmad"
  p.email           = "talk.to.waseem@gmail.com"
  p.ignore_pattern  = ["tmp/*", "script/*", 'pkg/*']
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
