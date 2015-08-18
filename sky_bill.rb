require 'sinatra'

set :root, File.dirname(__FILE__)
set :views, Proc.new { File.join(root, "app/views") }

Dir['./app/adapters/*.rb'].each { |file| require file }
Dir['./app/models/**/*.rb'].each { |file| require file }
Dir['./app/controllers/**/*.rb'].each { |file| require file }
