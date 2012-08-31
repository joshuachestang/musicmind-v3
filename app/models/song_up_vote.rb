class SongUpVote < ActiveRecord::Base

	tracked
	
	belongs_to :master_song, :counter_cache => true

	validates :user_id, presence: :true

	attr_accessible :master_song_id

end
