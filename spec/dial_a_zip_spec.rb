require 'spec_helper'

module LadyGaga
  describe DialAZip do

    subject { DialAZip }

    let(:request) { subject.new }

    let(:credentials) do
      {'USER' => '1234', 'PASSWORD' => 'password'}
    end

    before(:each) do
      request.stub(:credentials).and_return(credentials)
    end
    
    describe "#post" do

      before(:each) do
        subject.stub(:post).and_return('')
      end
      
      it "returns a response object" do
        request.post.should be_a(Response)
      end
    end
  end

end
