require 'httparty'
require 'activesupport'

module LadyGaga
  class Request

    include HTTParty

    format :xml

    attr_accessor :xml_path, :xml_root, :path, :credentials
    
    def default_options
      {}
    end

    def credentials
      {}
    end

    def options
      @options ||= default_options
    end

    def <<(hash)
      options.merge!(hash)
    end

    def reset!
      @options = default_options
    end

    def body
      {xml_param => options.merge(credentials).to_xml(:root => xml_root, :skip_instruct => true)}
    end

    def get
      response = self.class.get(path, :query => body)
      Response.new(response)
    end
    
    def post
      response = self.class.post(path, :body => body)
      Response.new(response)
    end
  end
end
