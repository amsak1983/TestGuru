# frozen_string_literal: true

class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
    @feedback.tap do |f|
      f.name = "#{current_user&.last_name} #{current_user&.first_name} (#{current_user&.username})"
      f.email = current_user&.email
    end
    assign_user
  end

  def create
    @feedback = Feedback.new(feedback_params)
    assign_user

    if @feedback.save
      FeedbacksMailer.send_message(@feedback).deliver_now
      redirect_to root_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def assign_user
    @feedback.user = current_user if current_user
  end

  def feedback_params
    params.require(:feedback).permit(:message, :name, :email)
  end
end
