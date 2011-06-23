require 'spec_helper'

module LadyGaga
  describe Request do

    subject { Request }

    let(:path) { 'http://someurl.com' }
    let(:xml_param) { 'q' }
    let(:xml_root)  { 'root' }

    let(:default_options) do
      {'USER' => '1234', 'PASSWORD' => 'password'}
    end

    before(:each) do
      @request = subject.new
    end

    describe '#default_options' do
      it 'defaults to an empty hash' do
        @request.default_options.should eql({})
      end
    end

    describe '#options' do
      it 'defaults to the default_options' do
        @request.stub(:default_options).and_return(default_options)
        @request.options.should === default_options
      end
    end

    describe '#<<' do
      it "merges a hash into the existing options" do
        @request << {:foo => "bar"}
        @request.options[:foo].should == "bar"
      end
    end

    describe '#reset!' do
      it "resets the parameters to a blank hash" do
        @request << {:foo => 'bar'}
        @request.reset!
        @request.options.should_not have_key(:foo)
      end
    end

    context "making a request" do

      before(:each) do
        @request.stub(:path).and_return(path)
        @request.stub(:xml_param).and_return(xml_param)
        @request.stub(:xml_root).and_return(xml_root)
      end

      describe '#post' do
        before(:each) do
          subject.stub(:post).and_return('')
        end

        it 'returns a Response object' do
          @request.post.should be_a(Response)
        end
      end

      describe '#get' do
        before(:each) do
          subject.stub(:get).and_return('')
        end

        it 'returns a Response object' do
          @request.get.should be_a(Response)
        end
      end
    end
  end

end
