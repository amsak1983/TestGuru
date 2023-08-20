# frozen_string_literal: true

module ApplicationHelper

  def corrent_year
    Time.now.year
  end

  def github_url(autor, repo)
    link_to autor, repo, target: '_blank', rel: 'nofollow noopener'
  end
end
