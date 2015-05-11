class Text < ActiveRecord::Base

  belongs_to :user
  belongs_to :contact


  validates_presence_of :content
  validates_presence_of :phone_number
  validates_presence_of :time
  validates_presence_of :user_id
  validates_presence_of :contact_id

  # def self.send
  #   #logic looking at database. if a text is not sent and is within a certain time range then send out.  This will be call
  # end



  def reminder
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