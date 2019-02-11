class Attendance < ApplicationRecord
	belongs_to :user
	belongs_to :event
	after_create :inscription_event_email
	validates :user_id, presence: true
	validates :event_id, presence: true


	def inscription_event_email
		UserMailer.inscription_event_email(self).deliver_now
	end
end
