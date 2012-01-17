This is a small example program demonstrating the use of Authlogic, Rails 3.0 and RSpec 2. For some reason the tests don't work but I don't know why. I'm putting this code online in the hope that someone can tell me what's wrong.

There is a User model and corresponding migration with the minimum required fields. There is also a UserSession object. I found a bug in the Authlogic session generator though: `rails g authlogic:session user_session` generates a file containing:

    class user_session < Authlogic::Session::Base
    end

Obviously `user_session` should be `UserSession` in this file.

There is only one controller, `OverviewController`, which maps to the root path and prints the email address of the currently logged in user.

There is only one test, namely the controller spec `overview_controller_spec`. It's supposed to create a user, log in the user, and invoke `OverviewController#index`. In `spec_helper.rb` I've required `authlogic/test_case` and included `Authlogic::TestCase` in the RSpec config block, as per the Authlogic documentation.

To see the test failing:

    bundle install
    bundle exec rake db:migrate
    bundle exec rake spec

You should see something like:

    Failures:
    
      1) OverviewController GET index works
         Failure/Error: Unable to find matching line from backtrace
         NoMethodError:
           undefined method `request=' for nil:NilClass
         # /opt/ruby-enterprise-1.8.7-2010.01/lib/ruby/gems/1.8/gems/activesupport-3.0.11/lib/active_support/whiny_nil.rb:48:in `method_missing'
         # /opt/ruby-enterprise-1.8.7-2010.01/lib/ruby/gems/1.8/gems/authlogic-3.1.0/lib/authlogic/controller_adapters/abstract_adapter.rb:63:in `send'
