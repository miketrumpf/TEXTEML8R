class User < ActiveRecord::Base

  has_secure_password

  has_and_belongs_to_many :contacts
  has_many                :texts

  validates :username, 
            presence: true,
            uniqueness: true

  validates :phone_number,
            presence: true,
            numericality: {only_integer: true}

















end