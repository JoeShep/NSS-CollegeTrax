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
    Type ./trax to return to the menu for other commands.

    EOS
  end

  def ranking_prompt
    ranking_prompt = <<-EOS
    Now for the fun part! Rank the following categories from 1 to 5.
    Feel free to use decimals (2.5, 3.75, 1.22, whatever).
    Enter NA for any category you want to skip.
    ================================================================

    EOS
  end
end