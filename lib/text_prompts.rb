# require '../bootstrap_ar'

module TextPrompts

  def contact_prompt
    contact_prompt = <<-EOS
    Do you want to add contact info for someone you met during your visit? \x1b[35my or n\x1b[0m
    EOS
  end

  def yes_no_prompt1
    yes_no_prompt1 = <<-EOS
    No problem. We'll skip that part.
    Enter \x1b[35my\x1b[0m or \x1b[35mn\x1b[0m for the following questions:

    EOS
  end

  def yes_no_prompt2
    yes_no_prompt2 = <<-EOS

    Cool. Let's put in some more details about your visit.
    Enter \x1b[35my\x1b[0m or \x1b[35mn\x1b[0m for the following questions:

    EOS
  end

  def skip_rankings
    skip_rankings = <<-EOS
    OK. You can always come back and rate your visit later.
    Type \x1b[35m./trax\x1b[0m to return to the menu for other commands.

    EOS
    puts skip_rankings
  end

  def ranking_prompt
    ranking_prompt = <<-EOS

    Now for the fun part! Rank the following categories from 1 to 5.
    Feel free to use decimals (2.5, 3.75, 1.22, whatever).
    Enter NA for any category you want to skip.
    ================================================================

    EOS
  end

  def format_tracker(school)
   if !school.contact_name.nil?
    with_contact=<<-EOS

    \x1b[7m#{school.school_name}\x1b[0m
    Visited on #{school.formatted_date}

    \x1b[7mContact info:\x1b[0m
    Name:  #{school.contact_name}
    Email: #{school.contat_email}
    Phone: #{school.contact_phone}

    \x1b[7mVisit info:\x1b[0m
    Was school in session? #{school.in_session.capitalize}
    Did I take a tour? #{school.tour.capitalize}
    Did I attend an info session? #{school.info_session.capitalize}
    Did I stay overnight on campus? #{school.overnight.capitalize}
    Did I attend a class? #{school.class_visit.capitalize}
    Did I have an admissions interview? #{school.interview.capitalize}


    EOS
    puts with_contact
   else
    without_contact=<<-EOS

    \x1b[7m#{school.school_name}\x1b[0m
    Visited on #{school.formatted_date}

    \x1b[7mContact info:\x1b[0m
    None added!
    Type \x1b[35m./trax new_contact\x1b[0m
    to add a contact

    \x1b[7mVisit info:\x1b[0m
    Was school in session? \x1b[36;1m#{school.in_session.capitalize}\x1b[0m
    Did I take a tour? \x1b[36;1m#{school.tour.capitalize}\x1b[0m
    Did I attend an info session? \x1b[36;1m#{school.info_session.capitalize}\x1b[0m
    Did I stay overnight on campus? \x1b[36;1m#{school.overnight.capitalize}\x1b[0m
    Did I attend a class? \x1b[36;1m#{school.class_visit.capitalize}\x1b[0m
    Did I have an admissions interview? \x1b[36;1m#{school.interview.capitalize}\x1b[0m

    EOS
    puts without_contact
   end
   if !school.ranking
      puts <<-EOS
    You have not ranked your visit to #{school.school_name}.
    Would you like to now? \x1b[35my or n\x1b[0m
      EOS
      if $stdin.gets.chomp.downcase == "y"
        get_rankings(school.school_name)
      else
        puts <<-EOS
    "OK. You can always come back and rate your visit later.
    Type \x1b[35m./trax\x1b[0m to return to the menu for other commands."
        EOS
      end
    else
    my_rankings =<<-EOS
    \x1b[7mMy Rankings\x1b[0m:
    Overall Score:   \x1b[36;1m#{school.ranking.overall}\x1b[0m    | Intramural Sports: \x1b[36;1m#{school.ranking.intramural_sports}\x1b[0m
    Campus:          \x1b[36;1m#{school.ranking.campus}\x1b[0m    | Library:           \x1b[36;1m#{school.ranking.library}\x1b[0m
    Classrooms:      \x1b[36;1m#{school.ranking.classrooms}\x1b[0m    | Majors:            \x1b[36;1m#{school.ranking.majors}\x1b[0m
    Special Diets:   \x1b[36;1m#{school.ranking.diets}\x1b[0m    | Other Activities:  \x1b[36;1m#{school.ranking.other_activities}\x1b[0m
    Dorms:           \x1b[36;1m#{school.ranking.dorms}\x1b[0m    | Students:          \x1b[36;1m#{school.ranking.students}\x1b[0m
    Food on Campus:  \x1b[36;1m#{school.ranking.food_campus}\x1b[0m    | Student Center:    \x1b[36;1m#{school.ranking.student_center}\x1b[0m
    Food off Campus: \x1b[36;1m#{school.ranking.food_off_campus}\x1b[0m    | College Town/City: \x1b[36;1m#{school.ranking.town}\x1b[0m

    EOS
    puts my_rankings
    end
  end


end