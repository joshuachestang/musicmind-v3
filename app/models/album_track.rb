class AlbumTrack < ActiveRecord::Base
    attr_accessible :ms_id

	belongs_to :ms, :class_name => "MasterSong"
	belongs_to :album, dependent: :destroy

    validates :ms_id, :presence => true

    def add_track_to_album
        album_track.create!(master_song.id => :ms_id)
    end
end
