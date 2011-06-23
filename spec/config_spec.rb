require 'spec_helper'

module LadyGaga
  describe LadyGaga do

    subject { Config }

    describe ".user" do
      it "sets the @user class variable" do
        Config.instance_variable_set(:@user, '12345')
        Config.user.should == '12345'
      end
    end
    
    describe ".user=" do
      it "sets the @user class variable" do
        Config.user = '6789'
        Config.instance_variable_get(:@user).should == '6789'
      end
    end


    describe ".password" do
      it "sets the @password class variable" do
        Config.instance_variable_set(:@password, 'password')
        Config.password.should == 'password'
      end
    end
    
    describe ".password=" do
      it "sets the @password class variable" do
        Config.password = 'new_password'
        Config.instance_variable_get(:@password).should == 'new_password'
      end
    end

    
  end
end
