require 'rufus-scheduler'
require 'net/http'
require './config.rb'
require 'json'
include Config

scheduler = Rufus::Scheduler.new
http = Net::HTTP

# scheduler.every '1d' do
  instagram_uri = URI(INSTAGRAM[:SERVER_URL])
  api_path = INSTAGRAM[:API][:PATH]
  instagram_uri.path = "#{api_path[:VERSION]}#{api_path[:RECENT_MEDIA]}"
  instagram_uri.query = URI.encode_www_form({access_token: INSTAGRAM[:ACCESS_TOKEN]})
  res = http.get_response(instagram_uri)
  body = res.body if Net::HTTPSuccess
  posts = JSON.parse(body)['data']
# end