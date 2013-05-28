require_relative '../test_helper'

class TestAddingVisit < MiniTest::Unit::TestCase
  include DatabaseCleaner

  def test_passing_no_arg_prints_menu
    actual = `./trax`
    logo = <<EOS

.oPYo.        8 8                      ooooo
8    8        8 8                        8
8      .oPYo. 8 8 .oPYo. .oPYo. .oPYo.   8   oPYo. .oPYo. `o  o'
8      8    8 8 8 8oooo8 8    8 8oooo8   8   8  `' .oooo8  `bd'
8    8 8    8 8 8 8.     8    8 8.       8   8     8    8  d'`b
`YooP' `YooP' 8 8 `Yooo' `YooP8 `Yooo'   8   8     `YooP8 o'  `o
:.....::.....:....:.....::....8 :.....:::..::..:::::.....:..:::..
:::::::::::::::::::::::::::ooP'.:::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::...:::::::::::::::::::::::::::::::::::
EOS

    menu = <<-EOS

                        CollegeTrax Menu

Return to this menu                          \x1b[35m./trax\x1b[0m
Add a new school to your tracker:            \x1b[35m./trax add\x1b[0m
Add rankings to a school in your tracker:    \x1b[35m./trax rank "School Name in quotes"\x1b[0m
View a list of schools in your tracker:      \x1b[35m./trax list\x1b[0m
View a full visit report for a school:       \x1b[35m./trax view "School Name in quotes"\x1b[0m
View all schools by your overall ranking:    \x1b[35m./trax rankings\x1b[0m
Delete an existing school from your tracker: \x1b[35m./trax remove "School Name in quotes"\x1b[0m

EOS
    expected = logo + menu
    assert_equal expected, actual
  end

  def test_takes_name_and_date_arguments_and_saves_them
    assert_equal 0, Visit.count
    `./trax add "School U", "January 4, 2014"`
    assert_equal 1, Visit.count
  end

  def test_takes_1_visit_argument_and_puts_it_in_column
    `./trax add "School U"`
    assert_equal "School U", Visit.last.school_name
  end

  def test_takes_any_format_of_date_and_prints_slash_format
    `./trax add "School U", "February 4, 2014"`
    assert_equal "02/04/14", Visit.last.formatted_date
  end

end