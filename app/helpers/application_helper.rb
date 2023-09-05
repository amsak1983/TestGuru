# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author, repo, target: '_blank', rel: 'nofollow noopener'
  end

  def flash_message(argument)
    return unless flash[argument].present?

    content_tag :p, flash[argument], class: "flash #{argument}"
  end
end
