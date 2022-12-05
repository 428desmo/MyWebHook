require "json"

json=`curl -s http://localhost:4040/api/tunnels`
hash=JSON.parse(json)

url=hash['tunnels'][0]['public_url']

puts url
