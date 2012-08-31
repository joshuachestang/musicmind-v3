class MasterSongComment < ActiveRecord::Base
	tracked
	validates :master_song_id, :comment, presence: :true
	belongs_to :master_song, :class_name => "MasterSong", :counter_cache => true
	belongs_to :user, :class_name => "User"
	attr_accessible :comment, :master_song_id, :user_id

   
end
