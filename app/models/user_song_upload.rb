class UserSongUpload < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  require 'open-uri'
  require 'id3'
  
  tracked
	belongs_to :user, dependent: :destroy
  has_attached_file :song

  after_save :set_id3_tags
  
  has_many :song_listens, :as => :listenable, :class_name => "SongListen"

  validates :song, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :song

  #searchable do
   # text :title, :album, :artist
   # integer :user_id
  #end

  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.search(params)
    tire.search(load: true) do
      query { string params[:query] } if params[:query].present?
    end
  end

  attr_accessible :song, :favorite, :artist, :album, :title, :length
  

  def recently_added #must group together and render the most recently added between the two
    user_song_uploads.order(:created_at).limit(10) + master_song_ownings.order(:created_at).limit(10)
  end

  def master_songs_total
    master_song_ownings.count
  end

  def user_song_uploads_total
    user_song_uploads.count
  end

  def add_favorite
    self.favorite = true
  end

# def set_id3_tags
#   z = ID3::Tag2.new do |f|
#     f.read(self.song.path)
#     f = f['TITLE']['text']
#   end

#   y = ID3::Tag2.new do |f|
#     f.read(self.song.path)
#     f = f['ARTIST']['text']
#   end

#   x = ID3::Tag2.new do |f|
#     f.read(self.song.path)
#     f = f['ALBUM']['text']
#   end
  
#   w = ID3::Tag2.new do |f|
#     f.read(self.song.path)
#     f = f['SONGLEN']['text']
#   end
  
#   if title.nil?
#     self.update_attributes(:title => z)
#   elsif artist.nil?
#     self.update_attributes(:artist => y)
#   elsif album.nil?
#     self.update_attributes(:album => x) 
#   elsif length.nil?
#     self.update_attributes(:length => w)
#   else  
#   end
# end

  def set_id3_tags
    z = TagLib::FileRef.open(self.song.path) do |fileref|
      tag = fileref.tag
      tag.title
    end
    y = TagLib::FileRef.open(self.song.path) do |fileref|
      tag = fileref.tag
      tag.artist
    end
    x = TagLib::FileRef.open(self.song.path) do |fileref|
      tag = fileref.tag
      tag.album
    end
    w = TagLib::FileRef.open(self.song.path) do |fileref|
      properties = fileref.audio_properties
      properties.length
    end
    if title.nil?
      self.update_attributes(:title => z)
    elsif artist.nil?
      self.update_attributes(:artist => y)
    elsif album.nil?
      self.update_attributes(:album => x) 
    elsif length.nil?
      self.update_attributes(:length => w)
    else  
    end
  end


#matches user song uploads with master song uploads
def match_user_song_uploads_with_master
  master_song = MasterSong.find(params[:m_song_fingerprint])
    if self.song_fingerprint == master_song.m_song_fingerprint do
      self.user.master_song_relationships.create!(:owned_id => master_song.id)
      self.delete
    end
  end
end

def match_v_2
for id_iterate in 0..MasterSong.count
      if self.song_fingerprint == MasterSong.find_all_by_id(id_iterate).m_song_fingerprint
         self.user.master_song_relationships.create!(:owned_id => id_iterate)
         self.delete
      end
    end
=begin




  msong_contenst = msong.contents
  found_soung = MasterSong.detect { |master_song| msong_contents == master_song.contents }
  if found 


    for id_iterate in 0..MasterSong.count
      if self == MasterSong.find_all_by_id(id_iterate)!
         self.user.master_song_relationships.create(:owned_id => id_iterate)
         self.delete
      end
    end
  end
=end

  #def song_play_count
    #count amount of times a song has been downloaded by a user
    #1. create column for download account in user_song_upload model
    #2. create method to increment a count by the number of times a button is clicker - see awd - page count
    #3. attach method to view on html5 click
    #4. thinking of graph/w new download, new fan base join, new listen, new purchase, new upload, new fan, 
    #new follower, new following, new album purchase, 
        # seeking a comprehensive graph of the musicmind experience. a music/social timeline, 
        #listen count, suggestions, upvotes, playlist purchases
        #draw graphic rep of all.
  #end
end
end


