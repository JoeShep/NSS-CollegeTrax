# require_relative '../test_helper'


# class TestRemovingVisit < MiniTest::Unit::TestCase
#   include DatabaseCleaner

#   def test_remove_only_visit
#     `./collegetrax.rb add "School U"`
#     `./collegetrax.rb remove "School U"`
#     assert Visit.all.empty?
#   end

#   def test_remove_particular_visit
#     `./collegetrax.rb add "School A"`
#     `./collegetrax.rb add "School B"`
#     `./collegetrax.rb add "School C"`
#     assert !Visit.where( school_name: "School B").all.empty?
#     `./collegetrax.rb remove "School B"`
#     assert Visit.where( school_name: "School B").all.empty?
#     assert_equal 2, Visit.count
#   end


# end