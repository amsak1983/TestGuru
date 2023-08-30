# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author, repo, target: '_blank', rel: 'nofollow noopener'
  end

  def flash_message(content_tag, argument, class_tag)
    return unless flash[argument].present?

    content_tag content_tag, flash[argument], class: class_tag
  end
end
