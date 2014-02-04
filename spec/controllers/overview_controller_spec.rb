require 'spec_helper'

describe OverviewController do
  before :each do
    activate_authlogic
  end

  describe "GET index" do
    it "works" do
      @user = User.create!(:email => 'foo@bar.com', :password => '123456', :password_confirmation => '123456')
      UserSession.create(@user)
      get :index
      response.body.should == "hello foo@bar.com"
    end

    it "does not automatically login a user upon creating it" do
      @user = User.create!(:email => 'foo@bar.com', :password => '123456', :password_confirmation => '123456')
      get :index
      response.body.should == "hello nil"
    end
  end
end
