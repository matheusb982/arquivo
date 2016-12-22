require "net/http"
require "uri"
require 'json'

puts "Digite seu CEP:"
cepp = gets.to_s

domain = "http://www.cepaberto.com/api/v2/ceps.json"
uri = URI(domain)
params = {'cep' => cepp[0..7]}
headers = { "Authorization" => "Token token=45a1781f8656f13874bdbe34ad745e12" }

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.path)
request.set_form_data(params)
request = Net::HTTP::Get.new(uri.path + '?' + request.body, headers)
response = http.request(request)
var = JSON.parse( response.body )

puts "\n"
print 'Latitude: ' + var['latitude']
puts "\n"
print 'Longitude: ' + var['longitude']
puts "\n"
print 'Bairro: ' + var['bairro']
puts "\n"
print 'Logradouro: ' + var['logradouro']
puts "\n"
print 'Cidade: ' + var['cidade']
puts "\n"
print 'Estado: ' + var['estado']
puts "\n"
