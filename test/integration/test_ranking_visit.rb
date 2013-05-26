require_relative '../test_helper'

class TestRankingVisit < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_entering_a_ranking_saves_to_a_column
    assert_equal 0, Ranking.count
    Visit.create(school_name: "foo", visit_date: "April 22, 2014")
    CollegeTraxController.add_rankings
    assert_equal 1, Ranking.count
  end