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
end