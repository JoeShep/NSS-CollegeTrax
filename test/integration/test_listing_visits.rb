require_relative '../test_helper'

class TestListingVisits < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_listing_when_there_are_no_visits
    assert Visit.all.empty?
    actual = `./collegetrax.rb list`
    assert_equal "", actual
  end

  def test_listing_multiple_visits
    Visit.create(school_name: "Foo U", visit_date: "April 22, 2014")
    Visit.create(school_name: "Bar College", visit_date: "May 2, 2013")
    actual = `./collegetrax.rb list`
    expected = <<-EOS
1. Foo U, visited on 04/22/14.
2. Bar College, visited on 05/02/13.
EOS
    assert_equal expected, actual
  end

#   def test_listing_rankings
#     `./collegetrax.rb add "Foo U", "April 22, 2014", 3.8`
#     `./collegetrax.rb add "Bar College", "November 29, 2013", 4`
#     actual = `./collegetrax.rb list_rankings`
#     expected = <<-EOS
# 1. Bar College, Average rank: 4.0
# 2. Foo U, Average rank: 3.8
# EOS
#     assert_equal expected, actual
#   end
end