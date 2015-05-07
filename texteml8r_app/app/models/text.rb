class Text < ActiveRecord::Base

  belongs_to :user
  belongs_to :contact


  validates_presence_of :content
  validates_presence_of :from_number
  validates_presence_of :to_number
  validates_presence_of :user_id
  validates_presence_of :contact_id




end