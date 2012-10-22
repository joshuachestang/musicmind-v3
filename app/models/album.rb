class Album < ActiveRecord::Base
	validates :album_title, presence: :true
	validates_presence_of :album_artwork, allow_nil: :true
    validates :album_artwork, :attachment_presence => true
    validates_with AttachmentPresenceValidator, :attributes => :album_artwork
	
    belongs_to :user
	has_many :album_tracks, foreign_key: :album_id

    accepts_nested_attributes_for :album_tracks

    attr_accessible :album_artwork, :album_title, :album_tracks_attributes

    has_attached_file :album_artwork, :styles => { :medium => "300x300>", :medium2 => "150x150>", :thumb => "100x100>" }

    #, :storage => :s3,
    #:s3_credentials => "#{Rails.root}/config/s3.yml",
    #  :path => "/:style/:id/:filename"

    def album_price
    	self.album_tracks.master_songs.sum(:price)
    end
end
