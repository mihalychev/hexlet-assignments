# frozen_string_literal: true

require 'happymapper'

module Ipgeobase
  class IpMeta
    include HappyMapper

    tag 'query'
    element :lat, String, tag: 'lat'
    element :lon, String, tag: 'lon'
    element :city, String, tag: 'city'
    element :country, String, tag: 'country'
    element :country_code, String, tag: 'countryCode'
  end
end
