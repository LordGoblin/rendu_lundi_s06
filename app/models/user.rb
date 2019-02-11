class User < ApplicationRecord
	has_many :attendances
	has_many :events, through: :attendances
	after_create :welcome_send

	validates :email, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true

	validates :email, length: { minimum: 3 }
	validates :first_name, length: { minimum: 3 }
	validates :last_name, length: { minimum: 3 }
  	def welcome_send
    	UserMailer.welcome_email(self).deliver_now
  	end
end
