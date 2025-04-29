# frozen_string_literal: true

module Admin
  module BadgesHelper
    def badge_value_text(badge)
      case badge.rule
      when 'all_category_tests_passed'
        badge.value.to_s
      when 'all_level_tests_passed'
        t("tests.levels.#{badge.value}")
      else
        badge.value.to_s
      end
    end
  end
end
