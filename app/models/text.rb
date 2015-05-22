class Text < ActiveRecord::Base

  belongs_to :user
  belongs_to :contact


  validates_presence_of :content
  validates_presence_of :phone_number
  validates_presence_of :time
  validates_presence_of :user_id
  validates_presence_of :contact_id

  #send scheduled texts out method
  def send_all_texts

    #heroku scheduler runs rake task to check DB every 10 minutes, not every minute like whenever gem.  Logic has to account for that range of time.
    if (Time.now - 10.minutes) <= self.time && self.time <= Time.now + 10.minutes  && sent == false
      self.sent = true
      self.save
      self.twilio_text
    else
    end

  end


  #texts within the + - 10 minute range hit this method to be sent out using twilio api
  def twilio_text
    
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    time_str = self.time
    content = "#{self.content} Sent from the Twilio App. Please do not reply"
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.phone_number,
      :body => content
      )
    puts message
  end



end