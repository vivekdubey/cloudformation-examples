require 'sinatra'
require 'sinatra/activerecord'
require_relative 'config/environments' #database configuration
require_relative 'models/visit'
require 'net/http'
require 'uri'
require_relative 'lib/app'

get '/' do
  service_instance_id = instance_id
  refresh_count(service_instance_id)
  @count = total_visits
  @instance = service_instance_id
  @visits_per_instance = visits_per_instance(service_instance_id)
  erb :index
end

post '/refresh' do
	redirect '/'
end
