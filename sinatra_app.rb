require 'sinatra'
require './config/application.rb'

set :root, File.dirname(__FILE__)
set :views, Proc.new { File.join(root, "app/views") }

Config::Application.start