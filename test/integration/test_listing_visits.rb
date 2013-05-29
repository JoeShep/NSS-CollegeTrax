require_relative '../test_helper'

class TestListingVisits < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_listing_when_there_are_no_visits
    assert Visit.all.empty?
    actual = `./trax list`
    assert_equal "\n" + "\n", actual
  end

  def test_listing_multiple_visits
    Visit.create(school_name: "Foo U", visit_date: "April 22, 2014")
    Visit.create(school_name: "Bar College", visit_date: "May 2, 2013")
    actual = `./trax list`
    expected = <<-EOS

1. Foo U, visited on 04/22/14.
\e[7m2. Bar College, visited on 05/02/13.\e[0m

EOS
    assert_equal expected, actual
  end

end