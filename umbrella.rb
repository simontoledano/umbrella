require http

pp "Where are you located?"

#user_location = gets.chomp 

user_location = "Boston"

pirate_weather_api_key = ENV.fetch("PIRATE_WEATHER_KEY")

pirate_weather_url= "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" + ENV.fetch("GMAPS_KEY")

require "http"

resp = HTTP.get(maps_url)

pp resp
