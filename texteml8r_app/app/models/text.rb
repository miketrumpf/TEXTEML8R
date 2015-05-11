class Text < ActiveRecord::Base

  belongs_to :user
  belongs_to :contact


  validates_presence_of :content
  validates_presence_of :phone_number
  validates_presence_of :time
  validates_presence_of :user_id
  validates_presence_of :contact_id

  #after a text is created the reminder method should run
  after_create :reminder

  # @@Reminder_Time = 0.minutes

  #this should create the message took away the message variable to try to force the text through manually using the line of code Delayed::Worker.new.run(Delayed::Job.last)
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

  #not forcing the reminder with job.last code, this gets hit.  time is the right time that it is supposed to send out 
  # def when_to_run
  #   time 
  # end

  #when does this run?
  binding.pry
  handle_asynchronously :reminder, :run_at => Proc.new {-230.minutes.from_now}


end