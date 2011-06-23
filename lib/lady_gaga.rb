require 'lady_gaga/request'
require 'lady_gaga/response'
require 'lady_gaga/config'
require 'lady_gaga/dial_a_zip'

module LadyGaga
  class << self
    def configure(&block)
      yield Config
    end
  end
end
