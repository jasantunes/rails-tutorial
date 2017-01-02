require 'test_helper'

class ApplicationTestHelper < ActionView::TestCase

  test "full title helper test" do
    assert_equal full_title,         "Ruby on Rails Tutorial Sample App"
    assert_equal full_title("Help"), "Help | Ruby on Rails Tutorial Sample App"
  end

end

