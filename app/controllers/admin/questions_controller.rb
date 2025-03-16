# frozen_string_literal: true

module Admin
  class QuestionsController < Admin::BaseController
    before_action :set_question, only: %i[show edit update destroy]
    before_action :set_test, only: %i[new create edit update]

    # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

    def index
      @questions = Question.includes(:test).order(created_at: :desc)
                     .page(params[:page])
    end

    def show
      @answers = @question.answers
    end

    def new
      @question = @test.questions.build
      4.times { @question.answers.build }
    end    

    def edit
      (4 - @question.answers.count).times { @question.answers.build } if @question.answers.count < 4
    end

    def update
      if @question.update(question_params)
        redirect_to admin_test_path(@question.test), notice: t('admin.questions.updated')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def create
      @question = @test.questions.build(question_params)
      respond_to do |format|
        if @question.save
          format.html { redirect_to admin_test_path(@test), notice: t('admin.questions.created') }
          format.json do
            render json: {
              success: true,
              html:    render_to_string(partial: 'admin/tests/question',
                                        locals:  { question: @question },
                                        formats: [:html])
            }
          end
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json {
            render json:   { success: false, errors: @question.errors.full_messages },
                   status: :unprocessable_entity
          }
        end
      end
    end

    def destroy
      @question.destroy
      respond_to do |format|
        format.html { 
          redirect_to admin_test_path(@question.test),
                      notice: t('admin.questions.destroyed')
        }
        format.json { render json: { success: true } }
      end
    end

    private

    def set_question
      @question = Question.find(params[:id])
    end

    def set_test
      @test = Test.find(params[:test_id])
    end

    def question_params
      params.require(:question).permit(:body, answers_attributes: %i[id body correct _destroy])
    end

    def rescue_with_question_not_found
      redirect_to admin_tests_path, alert: t('admin.questions.not_found')
    end
  end
end
