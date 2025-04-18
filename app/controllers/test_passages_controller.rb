# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result]

  rescue_from NoMethodError, with: :rescue_with_no_method_error

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.time_expired? || @test_passage.completed?
      set_flash_alert
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_flash_alert
    flash[:alert] =
      if @test_passage.time_expired?
        t('test_passages.update.time_expired')
      elsif @test_passage.completed?
        t('test_passages.update.completed')
      end
  end

  def rescue_with_no_method_error
    render plain: "You didn't choose an answer"
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
