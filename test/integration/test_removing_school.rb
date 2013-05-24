require_relative '../test_helper'


class TestRemovingVisit < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_remove_only_visit
    Visit.create(school_name: "foo", visit_date: "April 22, 2014")
    `./collegetrax.rb remove "foo"`
    assert Visit.all.empty?
  end

  def test_remove_particular_visit
    Visit.create(school_name: "A", visit_date: "April 22, 2014")
    Visit.create(school_name: "B", visit_date: "April 22, 2014")
    Visit.create(school_name: "C", visit_date: "April 22, 2014")
    assert !Visit.where( school_name: "B").all.empty?
    `./collegetrax.rb remove "B"`
    assert Visit.where( school_name: "B").all.empty?
    assert_equal 2, Visit.count
  end


end