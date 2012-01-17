require 'spec_helper'

describe OverviewController do
  before :each do
    #puts "2: controller = #{controller.class.inspect}"
  end

  describe "GET index" do
    it "works" do
      #puts "3: controller = #{controller.class.inspect}"
      activate_authlogic
      @user = User.create!(:email => 'foo@bar.com', :password => '123456', :password_confirmation => '123456')
      UserSession.create(@user)
      get :index
      response.body.should == "hello foo@bar.com"
    end
  end
end
