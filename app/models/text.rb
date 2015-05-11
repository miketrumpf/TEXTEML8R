class Text < ActiveRecord::Base

  belongs_to :user
  belongs_to :contact


  validates_presence_of :content
  validates_presence_of :phone_number
  validates_presence_of :time
  validates_presence_of :user_id
  validates_presence_of :contact_id

  def send_all_texts
    
    binding.pry
    if self.time > Time.now  && sent == false
      binding.pry
      self.sent = true
      self.twilio_text
    else
    end


    # You will write code to check all the texts in your database, and identify the ones
    # that need to be sent out by comparing against Time.now
    # Probably also intelligently makring those as "sent", so you don't send them again later
  end



  def twilio_text
    binding.pry
    @twilio_number = +18622516960
    account_sid = 'AC9d30d018ecc459c52d264d69ea6cbad5'
    auth_token = '6dc966a5135aaee6b3d7d2d4c9cc6834'
    @client = Twilio::REST::Client.new account_sid, auth_token
    time_str = self.time
    content = "#{self.content} Please do not reply to this text"
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => self.phone_number,
      :body => content
      )
    puts message
  end



end