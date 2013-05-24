require_relative '../test_helper'

class TestCommandsThatDontExist < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_help_message_is_printed
    output = `./collegetrax.rb foo remove`
    ["list", "add", "remove",].each do |command| # "rankings" "view"
      assert output.include?(command), "Output was '#{output}', but should have included '#{command}'"
    end
  end

  def test_user_sees_error_message
    output = `./collegetrax.rb foo foo`
    message = "CollegeTrax does not (yet?) support the 'foo' command."
    assert output.include?(message), "Output was '#{output}', but should have included '#{message}'"
  end

end