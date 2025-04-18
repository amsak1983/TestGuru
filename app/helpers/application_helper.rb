# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_flash_class(type)
    case type
    when 'notice' then 'success'
    when 'alert' then 'danger'
    else type
    end
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author, repo, target: '_blank', rel: 'nofollow noopener', class: 'text-decoration-none'
  end

  def flash_message(argument)
    return unless flash[argument].present?

    content_tag :div, flash[argument], class: "flash #{argument}"
  end
end
