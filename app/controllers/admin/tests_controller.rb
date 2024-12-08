# frozen_string_literal: true

class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show destroy update_inline update_status]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

    def update_status
    if @test.update(status: !@test.status)
      flash[:notice] = "Status updated"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to admin_tests_path
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.deleted')
  end

  private

  def find_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test not found!'
  end
end
