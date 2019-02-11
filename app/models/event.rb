class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances
	belongs_to :user

	validates :start_date, presence: true
	validate :test_start_date
	
	validates :duration, presence: true
	validate :modulo_duration

	#validates :title, presence: true, length: { in: 1..140 }

	#validates :description, presence: true, length: { in: 20..1000 }

	#validates :price, presence: true, numericality: { only_integer: true }, numericality: { greater_than: 1, less_than_or_equal_to: 1000 }

	#validates :location, presence: true

	def test_start_date
		if start_date.present? && start_date.to_date < Date.today
			errors.add(:start_date, "can't be in the past")
		end
	end

	def modulo_duration
		if duration.present? && duration % 5 != 0
			errors.add(:duration, "must be a multiple of 5")
    	end
	end
end
