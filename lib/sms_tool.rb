module SmsTool
    ACCOUNT_SID = Rails.application.credentials.twilio[:account_sid]
    AUTH_TOKEN  = Rails.application.credentials.twilio[:auth_token]
    TRIAL_PHONE = Rails.application.credentials.twilio[:trial_phone]

    @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN

    def self.send_sms(number:, message:)
      byebug
      @client.messages.create(
        to: "+56#{number}", 
        from: TRIAL_PHONE,
        body: "#{message}"
      )
    end

end   
#@client.api.account.messages.create()
#SmsTool.send_sms(number: "947880067", message:"First Text From Twilio")