# You should edit this file with the browsers you wish to use
# For options, check out http://saucelabs.com/docs/platforms
require "sauce"
require 'sauce/capybara'

module SauceConfig
  def self.use_sauce?; false and (ENV['TRAVIS'] || ENV['USE_SAUCE']); end
end

Sauce.config do |config|
  config[:browsers] = [
    ["Windows 8", "Internet Explorer", "10"],             
    ["Windows 7", "Firefox", "20"],
    ["Windows XP", "Internet Explorer", "8"],
    ["OS X 10.8", "Safari", "6"],                         
    ["Linux", "Chrome", ""]
  ]

  # This needs to be a boolean, nil won't cut it as a falsish value
  config[:start_tunnel] = !!(SauceConfig.use_sauce? and ENV['SAUCE_CONNECT'])
  config[:start_local_application] = false
  config[:"tunnel-identifier"] = ENV['TRAVIS_JOB_NUMBER'] if ENV['TRAVIS_JOB_NUMBER']
end
