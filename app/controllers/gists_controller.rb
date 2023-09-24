class GistsController < ApplicationController

  def create
    @test_passage = TestPassage.find(params[:id])

    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      current_user.gists.create!(question: @test_passage.current_question, url: result.url)
      flash_options = { notice: t('gist.success_html', url: result.url).html_safe }
    else
      flash_options = { alert: t('gist.failure') }
    end

    redirect_to @test_passage, flash_options
  end
end
