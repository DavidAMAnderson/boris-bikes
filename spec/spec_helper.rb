require 'docking_station'
require 'bike'
require 'van'
require 'garage'
require_relative './support/shared_examples_for_bike_container.rb'

RSpec.configure do |config|
 # Use color in STDOUT
 config.color = true

 # Use color not only in STDOUT but also in pagers and files
 config.tty = true

 # Use the specified formatter
 config.formatter = :documentation # :progress, :html, :textmate
end
