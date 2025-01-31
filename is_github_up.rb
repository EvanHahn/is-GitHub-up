#!/usr/bin/env ruby
require 'net/http'
require 'json'

res = Net::HTTP.get_response(URI.parse('https://www.githubstatus.com/api/v2/status.json'))

if res.code != '200'
  puts "\033[31mUnable to reach GitHub\033[0m"
  exit 1
end

status = JSON.parse(res.body)['status']
indicator = status['indicator']

if indicator == 'none'
  print "\e[32m"
elsif indicator == 'minor'
  print "\e[33m"
else
  print "\e[31m"
end

print status['description']

puts "\033[0m"
