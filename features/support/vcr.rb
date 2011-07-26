require 'vcr'

def endicia_user
  ENV["ENDICIA_USER"] || 'USER'
end

def endicia_password
  ENV["ENDICIA_PASSWORD"] || 'PASSWORD'
end

VCR.config do |c|
  c.cassette_library_dir     = File.dirname(__FILE__) + '/../../spec/fixtures/cassettes'
  c.default_cassette_options = {
    :record             => :none,
    :match_requests_on  => [:host] }
  c.stub_with :webmock
  c.filter_sensitive_data('USER')     { endicia_user }
  c.filter_sensitive_data('PASSWORD') { endicia_password }
end
