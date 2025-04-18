# frozen_string_literal: true

# app/services/badge_assigner.rb
class BadgeAssigner
  RULES = %w[all_category_tests_passed first_attempt_success all_level_tests_passed].freeze
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.where(rule: RULES).active.each do |badge|
      assign_badge(badge) if rule_satisfied?(badge.rule, badge.value)
    end
  end

  private

  def assign_badge(badge)
    @user.badges << badge unless @user.badges.exists?(id: badge.id)
  end

  def rule_satisfied?(rule, value)
    send("#{rule}?", value)
  end

  def all_category_tests_passed?(category_id)
    completed_ids = TestPassage.completed.successful.category(category_id).pluck(:test_id)
    test_ids = Test.where(category: category_id).pluck(:id)
    (test_ids - completed_ids).empty?
  end

  def first_attempt_success?(_value)
    @test_passage.successful_passage? && TestPassage.attempts_count(@test_passage.user_id, @test_passage.test_id) == 1
  end

  def all_level_tests_passed?(level)
    completed_ids = TestPassage.completed.successful.level(level).pluck(:test_id)
    test_ids = Test.where(level: level).pluck(:id)
    (test_ids - completed_ids).empty?
  end
end
