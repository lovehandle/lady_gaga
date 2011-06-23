module LadyGaga
  class DialAZip < Request

    base_uri 'dial-a-zip.com'

    protected

    def default_options
      {'COMMAND' => 'ZIP1'}
    end
    
    def credentials
      {'USER' => Config.user, 'PASSWORD' => Config.password}
    end

    def xml_root
      'VERIFYADDRESS'
    end

    def xml_param
      'input'
    end

    def path
      '/XML-Dial-A-ZIP/DAZService.asmx/MethodZIPValidate'
    end
  end
end
