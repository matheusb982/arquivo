require "net/http"
require "uri"
require 'json'

puts "Digite seu CEP:"
cep = gets.to_s

domain = "http://www.cepaberto.com/api/v2/ceps.json"
uri = URI(domain)
params = {'cep' => cep[0..7]}
headers = { "Authorization" => "Token token=45a1781f8656f13874bdbe34ad745e12" }

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.path)
request.set_form_data(params)
request = Net::HTTP::Get.new(uri.path + '?' + request.body, headers)
response = http.request(request)
var = JSON.parse( response.body )

p1la = var['latitude'].to_f
p1lo = var['longitude'].to_f


puts "Digite o CEP de destino:"
cep = gets.to_s

domain = "http://www.cepaberto.com/api/v2/ceps.json"
uri = URI(domain)
params = {'cep' => cep[0..7]}
headers = { "Authorization" => "Token token=45a1781f8656f13874bdbe34ad745e12" }

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.path)
request.set_form_data(params)
request = Net::HTTP::Get.new(uri.path + '?' + request.body, headers)
response = http.request(request)
var = JSON.parse( response.body )


p2la = var['latitude'].to_f
p2lo = var['longitude'].to_f


r = 6371
pi = 3.14159265359

p1la = ( p1la * pi ) / 180
p1lo = ( p1lo * pi ) / 180

p2la = ( p2la * pi ) / 180
p2lo = ( p2lo * pi ) / 180


dlat = p2la - p1la
dlon = p2lo - p1lo

a = Math.sin(dlat / 2) * Math.sin(dlat / 2) + Math.cos(p1la) * Math.cos(p2la) * Math.sin(dlon / 2) * Math.sin(dlon / 2)
d = 1-a
c = 2 * Math.atan2(	Math.sqrt(a), 	Math.sqrt(d))

result = r.to_f * c.to_f * 1000

puts result.round(2)
