# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  Url = Struct.new(:url) do
    def success?
      url.present?
    end
  end

  def call
    response = @client.create_gist(gists_params)

    if @client.last_response.status == 201
      Url.new(response.html_url)
    else
      Url.new
    end
  end

  private

  def gists_params
    {
      description: I18n.t('gist.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
