class Attendance < ApplicationRecord
	belongs_to :user
	belongs_to :event
	after_create :inscription_event_email

	def inscription_event_email
		UserMailer.inscription_event_email(self).deliver_now
	end
end
