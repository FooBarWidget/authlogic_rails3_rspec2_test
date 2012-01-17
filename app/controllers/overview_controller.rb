class OverviewController < ApplicationController
	def index
		render :text => "hello #{current_user.email}"
	end
end
