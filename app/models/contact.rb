class Contact < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :texts

  validates :name,
            presence: true

  validates :phone_number, presence: true
           


end