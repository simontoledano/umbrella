require "http"

pp "Where are you located?"

user_location = gets.chomp.gsub(" ","%20")

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

#below is http request for the user_location weather 

require "http"

pirate_weather_url = "https://api.pirateweather.net/forecast/" + ENV.fetch("PIRATE_WEATHER_KEY") + "/" + latitude.to_s + "," + longitude.to_s

#below is the get request 
weather_response = HTTP.get(pirate_weather_url)
weather_raw_response = weather_response.to_s

require "json"

weather_parse_resonse = JSON.parse(weather_raw_response) 

#digging at each level of the hash, but how to do use Hoppscotch to check it out if I am using the ENV class?
currently_key = weather_parse_resonse.fetch("currently")
temperature_key = currently_key.fetch("temperature")

temperature_message = "The current temperature in " + user_location.gsub("%20"," ") + " is " + temperature_key.to_s + "."
pp temperature_message
