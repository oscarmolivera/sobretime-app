class TwilioClient
  attr_reader :client
  byebug
  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def  send_sms(number, message)
    client.api.account.messages.create(
      to: "+56#{number}", 
      from: trial_phone,
      body: message
    )
  end

  private
    def account_sid
      Rails.application.credentials.twilio[:account_sid]
    end

    def auth_token
      Rails.application.credentials.twilio[:auth_token]
    end

    def trial_phone
      Rails.application.credentials.twilio[:trial_phone]
    end
  end

  #TwilioClient.new.send_sms(number: "947880067", message:"First Text From Twilio")