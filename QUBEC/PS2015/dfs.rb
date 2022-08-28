require 'net/http'
require 'debug'
require 'JSON'

@url = 'https://data.moviebuff.com/'

# require "json"
a = 'amitabh-bachchan'
b = 'robert-de-niro'

@uri = URI(@url+a)
@response = Net::HTTP.get(@uri)
binding.break
data = JSON.parse(@response)

binding.break
