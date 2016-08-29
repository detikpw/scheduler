require 'rufus-scheduler'
require 'net/http'
require './config.rb'
include Config

scheduler = Rufus::Scheduler.new
http = Net::HTTP

# scheduler.every '1d' do
  uri = URI(INSTAGRAM[:SERVER_URL])
  api_path = INSTAGRAM[:API][:PATH]
  uri.path = "#{api_path[:VERSION]}#{api_path[:RECENT_MEDIA]}"
  uri.query = URI.encode_www_form({access_token: INSTAGRAM[:ACCESS_TOKEN]})
  res = http.get_response(uri)
  body = res.body if http.superclass.HTTPSuccess
  puts body
# end