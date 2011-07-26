require 'rubygems'
require 'bundler/setup'
require 'digest/md5'
require 'lady_gaga'


module LadyGagaMethods

  def endicia_user
    ENV["ENDICIA_USER"] || 'USER'
  end

  def endicia_password
    ENV["ENDICIA_PASSWORD"] || 'PASSWORD'
  end

  def cassette_name
    Digest::MD5.hexdigest(@request.options.to_json)
  end

end

World(LadyGagaMethods)

Before do
  LadyGaga.configure do |config|
    config.user = endicia_user
    config.password = endicia_password
  end
end
