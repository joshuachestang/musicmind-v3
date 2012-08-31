class Event < ActiveRecord::Base
	belongs_to :fan_base, dependent: :destroy

	validates_presence_of :event_name, :event_time, :event_address, :event_city, :event_state, :zip_code 

end
