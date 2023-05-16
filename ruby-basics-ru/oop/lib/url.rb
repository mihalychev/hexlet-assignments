# frozen_string_literal: true

# BEGIN
require 'uri'
require 'forwardable'

class Url
  include Comparable
  extend Forwardable

  attr_reader :url, :query_params

  def_delegators :url, :scheme, :host, :port

  def initialize(url)
    @url = URI(url)
    query_string = @url.query || ''
    @query_params = query_string.split('&').to_h do |q|
      k, v = q.split('=')
      [k.to_sym, v]
    end
  end

  def query_param(key, default = nil)
    query_params.fetch(key, default)
  end

  def ==(other)
    scheme == other.scheme &&
      port == other.port &&
      host == other.host &&
      query_params == other.query_params
  end
end
# END
