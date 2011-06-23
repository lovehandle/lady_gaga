require 'rubygems'
require 'bundler/setup'
require 'digest/md5'
require 'lady_gaga'


module LadyGagaMethods
  def cassette_name
    Digest::MD5.hexdigest(@request.options.to_json)
  end

  def endicia
    @endicia ||= YAML::load_file(File.dirname(__FILE__) + "/../../spec/support/endicia.yml")
  end

  def endicia_user
    endicia['user']
  end

  def endicia_password
    endicia['password']
  end
end

World(LadyGagaMethods)

Before do
  LadyGaga.configure do |config|
    config.user = endicia_user
    config.password = endicia_password
  end
end
