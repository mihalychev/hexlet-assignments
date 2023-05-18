# frozen_string_literal: true

require 'net/http'
require 'addressable'

module Ipgeobase
  class HttpClient
    def initialize(host)
      @template = Addressable::Template.new("http://#{host}{/segments*}")
    end

    def get(ip)
      uri = @template.expand({ segments: ['xml', ip] })
      Net::HTTP.get(uri)
    end
  end
end
