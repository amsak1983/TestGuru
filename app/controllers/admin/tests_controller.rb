# app/controllers/admin/tests_controller.rb
# frozen_string_literal: true

module Admin
  class TestsController < Admin::BaseController
    before_action :set_test, only: %i[show edit update destroy
                                      update_status]

    rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

    def index
      @tests = Test.includes(:category).order(created_at: :desc)
                 .page(params[:page])
    end

    def show
      @questions = @test.questions.includes(:answers)
      @question = @test.questions.build
      4.times { @question.answers.build }
    end

    def new
      @test = Test.new
    end

    def create
      @test = Test.new(test_params)
      @test.creator = current_user
      if @test.save
        redirect_to admin_tests_path,
                    notice: t('admin.tests.created')
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @test.update(test_params)
        redirect_to admin_tests_path,
                    notice: t('admin.tests.updated')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @test.destroy
      redirect_to admin_tests_path,
                  notice: t('admin.tests.destroyed')
    end

    def update_status
      @test.update!(status: @test.draft? ? :active : :draft)
      redirect_to admin_tests_path,
                  notice: t('admin.tests.status_updated')
    end

    private

    def set_test
      @test = Test.find(params[:id])
    end

    def test_params
      params.require(:test).permit(:title, :level, :category_id, :status)
    end

    def rescue_with_test_not_found
      redirect_to admin_tests_path,
                  alert: t('admin.tests.not_found')
    end

    def authorize_admin!
      redirect_to root_path, alert: t('admin.unauthorized') unless current_user.admin?
    end
  end
end
