# app/services/badge_assigner.rb
class BadgeAssigner
  RULES = %w[first_test_passed tests_quantity category_tests_quantity].freeze
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.where(rule: RULES).each do |badge|
      assign_badge(badge) if rule_satisfied?(badge.rule)
    end
  end

  private

  def assign_badge(badge)
    @user.badges << badge unless @user.badges.exists?(id: badge.id)
  end

  def rule_satisfied?(rule)
    send(rule) if RULES.include?(rule)
  end

  def all_category_tests_passed?
    category = @test_passage.test.category
    category.tests.all? { |test| test_successful?(test) }
  end

  def first_attempt_success?
    @test_passage.successful_passage? && @test_passage.attempts == 1
  end

  def all_level_tests_passed?
    level = @test_passage.test.level
    Test.where(level: level).all? { |test| test_successful?(test) }
  end

  def test_successful?(test)
    @user.test_passages.find_by(test_id: test.id)&.successful_passage?
  end
end