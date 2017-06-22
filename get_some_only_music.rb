#aristotelesbr@gmail.com
require 'mechanize'

URL_BASE = 'http://www.youtubeinmp3.com/'
agent = Mechanize.new
page = agent.get(URL_BASE)

print "digite o nome da musica: "
music = gets.chomp
search_params = music.split.join("+")

# Get the value typed and go to url
youtube_search = "https://www.youtube.com/results?search_query=#{search_params}"
page = agent.get(youtube_search)

# Get the first item of the list
hash_result = page.at('.yt-lockup-title').css('a[href]').each_with_object({}) { |n, h| h[n.text.strip] = n['href'] }
result = hash_result.values.first

mp3 = agent.get("http://www.youtubeinmp3.com/download/?video=https://www.youtube.com#{result}")
link = mp3.at('.download-buttons a/@href').value

download_url = URL_BASE + link
puts 'download...'
file = agent.get(download_url)
5.times{ print "."; sleep(0.5)}
puts "\n"

# Rename file
download = File.new(file.filename, "w")
download.puts(file.body)
download.close
puts 'Pronto!!! Obrigado por usar :)'
