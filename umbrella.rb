require "http"

pp "Where are you located?"

user_location = gets.chomp.gsub(" ", "%20")

pirate_weather_api_key =ENV.fetch("PIRATE_WEATHER_KEY")

maps_url="https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" + ENV.fetch("GMAPS_KEY")

require "http"
#this line of code below I am a bit unsure of
resp = HTTP.get(maps_url)

raw_response = resp.to_s

require "json"

parsed_response = JSON.parse(raw_response)

results_fetch = parsed_response.fetch("results")

#below is a series of digs to get the longitude and latitude 
first_dig = results_fetch.at(0)
second_dig = first_dig.fetch("geometry")
third_dig = second_dig.fetch("location")
latitude = third_dig.fetch("lat")
longitude = third_dig.fetch("lng")
