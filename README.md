Lady Gaga
======

[![travis](https://secure.travis-ci.org/rclosner/lady_gaga.png)](http://travis-ci.org/rclosner/lady_gaga)

Lady Gaga is a minimalistic, Nokogiri-based Ruby wrapper to the [Endicia Web Services API](http://www.endicia.com/Developers/).

Currently the following APIs are supported:
  - [Dial-A-ZIP Address Verification API](http://www.endicia.com/Developers/ZipLookup/)

Usage
-----
Set up.

    LadyGaga.configure do |config|
      config.user = '1234'
      config.password = 'password'
    end

Initialize a request

    request = LadyGaga::DialAZip.new

Build request params.

    request << {
      'ADDRESS0' => 'John Doe',
      'ADDRESS1' => 'DYMO Endicia',
      'ADDRESS2' => '385 Sherman Ave',
      'ADDRESS3' => 'Palo Alto, CA 94306'
    }

Get a response.

    response = request.post

Check response validity:

    response.code
    returns: "200"

    response.valid?
    returns: true

Convert response to hash:

    response.to_h

    returns: {
    'Dial-A-ZIP_Response' => {
        'AddrLine1'    => '385 Sherman Ave',
        'AddrLine2'    => 'DYMO ENDICIA',
        'AddrLine3'    => '',
        'AddrLineLast' => 'PALO ALTO CA 94306-1864'
      }
     }


Or parse a response with Nokogiri:

    response.xml.css("Dial-A-ZIP_Response").each do |r|
      some business value
    end

    response.xml.xpath("//User")

----

To get started with the Dial-A-Zip Address Verification API, Sign Up for an Endicia Account and request API access.
