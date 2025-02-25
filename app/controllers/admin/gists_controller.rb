# frozen_string_literal: true

module Admin
  class GistsController < Admin::BaseController
    def index
      @gists = Gist.all
    end
  end
end
