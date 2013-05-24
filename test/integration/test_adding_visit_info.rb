require_relative '../test_helper'

class TestAddingVisitInfo < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_adding_contact_info
    Visit.create(school_name: "Foo U", visit_date: "April 22, 2014")
    Visit.create(school_name: "Bar College", visit_date: "May 2, 2013")
    actual = `./collegetrax.rb list`
    expected = <<-EOS
1. Foo U, visited on 04/22/14.
2. Bar College, visited on 05/02/13.
EOS
    assert_equal expected, actual
  end

end