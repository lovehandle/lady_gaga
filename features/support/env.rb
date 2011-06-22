require 'rubygems'
require 'bundler/setup'
require 'digest/md5'
require 'agent_cooper'


module LadyGagaMethods  
  def cassette_name
    Digest::MD5.hexdigest(@request.options.to_json)
  end
end

World(LadyGagaMethods)
