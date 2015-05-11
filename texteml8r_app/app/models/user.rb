class User < ActiveRecord::Base

  has_secure_password

  has_and_belongs_to_many :contacts
  has_many                :texts

  validates :username, 
            presence: true,
            uniqueness: true

  # def add_contact(contact)
  #   self.contacts.push(contact) unless self.contact.include? contact
  # end
















end