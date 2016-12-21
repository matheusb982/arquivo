require "net/http"
require "uri"
require 'json'

domain = "http://www.cepaberto.com/api/v2/ceps.json"
uri = URI(domain)
params = {'cep' => '60533170'}
headers = { "Authorization" => "Token token=45a1781f8656f13874bdbe34ad745e12" }

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.path)
request.set_form_data(params)
request = Net::HTTP::Get.new(uri.path + '?' + request.body, headers)
response = http.request(request)
var = JSON.parse( response.body )
puts "\n"
print '/n/n Latitude: ' + var['latitude']
puts "\n"
print '/n/n Longitude: ' + var['longitude']
puts "\n"
