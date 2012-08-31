module UserSongUploadsHelper

def total_songs
    master_song_ownings.count + user_song_uploads.count
  end	



end
