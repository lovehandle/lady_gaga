Given /^a new DialAZip request$/ do
  @request = LadyGaga::DialAZip.new
end

Then /^the returned address should equal:$/ do |table|
  response = @response.to_h['Dial_A_ZIP_Response']

  table.hashes.each do |address|
    address.each_pair do |k,v|
      returned_value = response[k]
      returned_value.should == v
    end
  end
end

