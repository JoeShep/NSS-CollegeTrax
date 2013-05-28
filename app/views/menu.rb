module Menu
  require 'rainbow'

  def self.print_menu
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

    puts logo.foreground(:red) + menu
  end

end