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

Return to this menu                          \x1b[35mtrax\x1b[0m
Add a new school to your tracker:            \x1b[35mtrax add\x1b[0m
View a list of schools in your tracker:      \x1b[35mtrax list\x1b[0m
View a full visit report for a school:       \x1b[35mtrax view "<school name in quotes>"\x1b[0m
View all schools by your average ranking:    \x1b[35mtrax rankings\x1b[0m
Delete an existing school from your tracker: \x1b[35mtrax remove "<school name in quotes>"\x1b[0m

EOS

    puts logo.foreground(:red) + menu
  end

end