class OverviewController < ApplicationController
  def index
    if current_user
      value = current_user.email
    else
      value = "nil"
    end
    render :text => "hello #{value}"
  end
end
