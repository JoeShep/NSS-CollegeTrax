require_relative '../test_helper'

class TestAddingVisit < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_takes_name_argument_and_saves_it
    assert_equal 0, Visit.count
    `./collegetrax.rb add Vandy`
    assert_equal 1, Visit.count
  end

  def test_takes_4_arguments_and_uses_them
    `./collegetrax.rb add foo, "Feb 4, 2024", 2 `
    assert_equal 'foo,', Visit.last.school_name
  end


end