class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result]

  rescue_from NoMethodError, with: :rescue_with_no_method_error

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if time_expired?
      flash[:alert] = t('test_passages.update.time_expired')
      redirect_to result_test_passage_path(@test_passage)
    elsif @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def rescue_with_no_method_error
    render plain: "You didn't choose an answer"
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def time_expired?
    (Time.current - @test_passage.created_at) >= @test_passage.test.duration.seconds
  end
end