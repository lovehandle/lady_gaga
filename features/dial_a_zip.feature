Feature: Endicia Dial-A-ZIP
  As an API consumer

  Background:
    Given a new DialAZip request

  Scenario: 
    Given the following parameters:
        | ADDRESS0 | ADDRESS1     | ADDRESS2        | ADDRESS3            |
        | John Doe | DYMO Endicia | 385 Sherman Ave | Palo Alto, CA 94306 |
     When I tape the "dial_a_zip" request as: "address_verification"
     Then the response code should be "200"
     And the returned address should equal:
        | AddrLine1       | AddrLine2    | AddrLineLast            |
        | 385 SHERMAN AVE | DYMO ENDICIA | PALO ALTO CA 94306-1864 |
