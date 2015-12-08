#!/usr/bin/env ruby

require 'image_downloader'

if ARGV.size != 2
  puts 'Sorry we need exactly two arguments'
  exit
end

page_url, directory = ARGV[0], ARGV[1]

unless File.exists?(directory)
  puts 'Sorry, but directory not exists'
  exit
end

grab = ImageDownloader::Process.new(page_url, directory)

p 'Parse pictures...'

grab.parse(any_looks_like_image: true)

p 'Downloading...'

grab.download

p 'Done!'
