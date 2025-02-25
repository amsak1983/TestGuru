# frozen_string_literal: true

class GistQuestionService
  class AuthenticationError < StandardError; end
  class ApiError < StandardError; end

  GistResult = Struct.new(:url, :success?) do
    def self.success(url)
      new(url, true)
    end

    def self.failure
      new(nil, false)
    end
  end

  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || default_client
    validate_client_configuration!
  end

  def call
    response = @client.create_gist(gists_params)
    handle_response(response)
  rescue Octokit::Unauthorized => e
    Rails.logger.error "GitHub authentication failed: #{e.message}"
    GistResult.failure
  rescue Octokit::Error => e
    Rails.logger.error "GitHub API error: #{e.message}"
    GistResult.failure
  end

  private

  def gists_params
    {
      description: I18n.t('gist.description', title: @test.title),
      public:      true,
      files:       {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def default_client
    Octokit::Client.new(
      access_token:  ENV.fetch('GITHUB_ACCESS_TOKEN', ''),
      auto_paginate: true,
      per_page:      100
    ).tap do |client|
      client.user_agent = 'TestGuru/v1'
    end
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def validate_client_configuration!
    return if @client.access_token.present?

    raise AuthenticationError, 'GitHub access token is not configured'
  end

  def handle_response(response)
    case @client.last_response.status
    when 201 then GistResult.success(response.html_url)
    else GistResult.failure
    end
  end
end
