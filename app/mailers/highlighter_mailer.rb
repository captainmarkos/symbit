class HighlighterMailer < ApplicationMailer
  # https://guides.rubyonrails.org/v5.2/action_mailer_basics.html

  def syntax_highlighted
    send_to = 'captainmarkos@gmail.com'
    mail(to: send_to, subject: 'Symbit | Yay +1')
  end
end
