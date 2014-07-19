# encoding: utf-8
require "sinatra"
require "json"
require "redis"
require "dotenv"


configure do
  # Load .env vars
  Dotenv.load
  # Disable output buffering
  $stdout.sync = true
  
  # Set up redis
  case settings.environment
  when :development
    uri = URI.parse(ENV["LOCAL_REDIS_URL"])
  when :production
    uri = URI.parse(ENV["REDISCLOUD_URL"])
  end
  $redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
end

get "/" do
  "hi."
end

post "/" do
  response = ""
  
  unless params[:text].nil? || params[:user_id] == "USLACKBOT" || params[:token] != ENV["OUTGOING_WEBHOOK_TOKEN"] || $redis.get("shushed")
    response = { text: get_reply, link_names: 1 }
    response[:username] = ENV["BOT_USERNAME"] unless ENV["BOT_USERNAME"].nil?
    response[:icon_emoji] = ENV["BOT_ICON"] unless ENV["BOT_ICON"].nil?
    response = response.to_json
    $redis.setex("shushed", ENV["SECONDS_BETWEEN_RESPONSES"].to_i, "true")
  end
  
  status 200
  body response
end

def get_reply
  redirect = " For general chat, please go to #{ENV["REDIRECT_CHANNEL"]}." if ENV["REDIRECT_CHANNEL"]
  "This is an automated reminder that chatting is discouraged in this channel.#{redirect} Thanks!"
end
