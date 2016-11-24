require 'twilio-ruby'

class SmsSender
  def initialize(slide)
    @slide  = slide
    @client = Twilio::REST::Client.new(ENV["SID"], ENV["AuthToken"])
  end

  def send_sms
    @client.account.messages.create(
      from: ENV["Phone"],
      to:   ENV["MyPhone"],
      body: "A new slide titled #{@slide.title_with_blanks} has been created."
    )
  end
end
