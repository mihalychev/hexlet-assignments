# frozen_string_literal: true

require_relative 'ipgeobase/version'
require_relative 'ipgeobase/http_client'
require_relative 'ipgeobase/ip_meta'

module Ipgeobase
  def self.lookup(ip)
    ip_api_client = HttpClient.new('ip-api.com')
    xml = ip_api_client.get(ip)
    IpMeta.parse(xml)
  end
end
