require 'spec_helper'

describe OverviewController do
	describe "GET index" do
		it "works" do
			@user = User.create!(:email => 'foo@bar.com', :password => '123456', :password_confirmation => '123456')
			get :index
			response.body.should == "hello foo@bar.com"
		end
	end
end
