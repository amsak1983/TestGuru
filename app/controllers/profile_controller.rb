# frozen_string_literal: true

# app/controllers/profiles_controller.rb
class ProfileController < ApplicationController
  def show
    @user = current_user
    @earned_badges = @user.badges.order(created_at: :desc)
  end
end
