require 'spec_helper'

module LadyGaga
  describe Response do

    let(:response) do
      mock(HTTParty::Response)
    end

    subject { Response.new(response) }

    describe "#body" do
      it "calls the HTTParty::Response#body" do
        response.should_receive(:body)
        subject.body
      end
    end

    describe "#to_h" do
      it "calls the HTTParty::Response#to_hash" do
        response.should_receive(:to_hash)
        subject.to_h
      end
    end

    describe "#code" do
      it "calls the HTTParty::Response#code" do
        response.should_receive(:code)
        subject.code
      end
    end

    describe "#valid?" do
      context "code is 200" do
        before(:each) do
          subject.stub(:code).and_return(200)
        end

        it "returns true" do
          subject.valid?.should be_true
        end
      end

      context "code is not 200" do
        before(:each) do
          subject.stub(:code).and_return(500)
        end

        it "returns false" do
          subject.valid?.should be_false
        end
      end
    end

    describe "#xml" do
      before(:each) do
        subject.stub(:body).and_return('')
      end

      it "returns a Nokogiri::XML document" do
        subject.xml.should be_a(Nokogiri::XML::Document)
      end
    end
  end
end
