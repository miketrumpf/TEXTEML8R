class Text < ActiveRecord::Base

  belongs_to :user
  belongs_to :contact


  validates_presence_of :content
  validates_presence_of :phone_number
  validates_presence_of :time
  validates_presence_of :user_id
  validates_presence_of :contact_id

  def send_all_texts
    
    if (Time.now - 1.minute) < self.time && self.time < Time.now  && sent == false
      self.sent = true
      self.save
      self.twilio_text
    else
    end


    # You will write code to check all the texts in your database, and identify the ones
    # that need to be sent out by comparing against Time.now
    # Probably also intelligently makring those as "sent", so you don't send them again later
  end



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