# frozen_string_literal: true

# app/controllers/admin/dashboard_controller.rb
module Admin
  class DashboardController < Admin::BaseController
    def index
      @categories_count = Category.count
      @tests_count = Test.count
      @users_count = User.count
      @gists_count = Gist.count
      @recent_tests = Test.order(created_at: :desc).limit(5)
    end
  end
end
