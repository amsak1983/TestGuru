module TestsHelper

  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :medium, 3 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end

  def test_header(test)
    if test.persisted?
      "Edit #{test.title} Test"
    else
      'Create New Test'
    end
  end
end
