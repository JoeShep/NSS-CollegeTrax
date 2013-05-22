require_relative '../test_helper'

class TestAddingVisit < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_takes_school_name_argument_and_saves_it
    assert_equal 0, Visit.count
    `./collegetrax.rb add "School U"`
    assert_equal 1, Visit.count
  end

  def test_takes_1_visit_argument_and_puts_it_in_column
    `./collegetrax.rb add "School U"`
    assert_equal "School U", Visit.last.school_name
  end

  def test_takes_2_visit_arguments_and_puts_them_in_columns
    `./collegetrax.rb add "School U", "Feb 4, 2024"`
    assert_equal "02/04/24", "#{Visit.last.formatted_date}"
  end

  def test_takes_3_visit_arguments_and_puts_them_in_columns
    `./collegetrax.rb add "School U", "Feb 4, 2024", 3.75`
    assert_equal 3.75, Visit.last.ranking
  end

  def test_takes_any_format_of_date_and_prints_slash_format
    `./collegetrax.rb add "School U", "Feb 4, 2014", 3`
    assert_equal "02/04/14", Visit.last.formatted_date
  end

  def test_takes_any_format_of_date_and_prints_slash_format
    `./collegetrax.rb add "School U", "February 4th, 2014", 3`
    assert_equal "02/04/14", Visit.last.formatted_date
  end


end