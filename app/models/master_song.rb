class MasterSong < ActiveRecord::Base

 scope :newly, order("created_at DESC")
 scope :upvoted, order("song_up_votes_count DESC")
 scope :trended, order("updated_at DESC")
 scope :free, where(:price => 0.00)
 scope :most_listened, order("song_listens_count DESC")
 
 require 'taglib'
  has_attached_file :m_song
  has_attached_file :song_art_work, :styles => { :medium => "300x300>", :thumb => "100x100>", :medium2 => "150x150>", :thumb_small => "50x50>" }
  after_save :set_id3_tags

  has_many :song_listens, :as => :listenable, :class_name => "SongListen"
  has_many :line_items
  belongs_to :user
  belongs_to :album
  has_many :song_up_votes, foreign_key: :master_song_id
  has_many :master_song_relationships, foreign_key: :owned_id
  has_many :owners, :through => :master_song_relationships, source: :owner
  has_many :master_song_comments, foreign_key: :master_song_id, dependent: :destroy
  #search function
  #searchable do
   # text :title, :artist, :album
  #end
  #pretty urls

  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.search(params)
    tire.search(load: true) do
      query { string params[:query] } if params[:query].present?
    end
  end

 extend FriendlyId
 friendly_id :title, :use => :slugged
  
  #activity feed
  #tracked
  

  #notifications
  #acts_as_readable :on => :created_at
 


  validates :price, allow_blank: :true, numericality: {greater_than_or_equal_to: 0.00}
  validates :m_song, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :m_song

  
  

  #, :storage => :s3,
   # :s3_credentials => "#{Rails.root}/config/s3.yml",
    # :path => "/:style/:id/:filename"

  

  #, :storage => :s3,
   # :s3_credentials => "#{Rails.root}/config/s3.yml",
    # :path => "/:style/:id/:filename"
  
  attr_accessible :price, :m_song, :song_art_work, :release_date, :title, :artist, :length, :terms, :playable, :album_id, :ep_title, :song_listens_count, :song_up_votes_count, :master_song_comments_count


before_destroy :ensure_not_referenced_by_any_line_item


 def self.from_users_followed_by(user)
    following_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{following_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end



  
#pre-order release date before and after Time.now
  def released?
    self.release_date <= DateTime.now
  end

#songs available for pre-order
  def not_released?
    self.release_date >= DateTime.now
  end

  
 def set_id3_tags
    z = TagLib::FileRef.open(self.m_song.path) do |fileref|
      tag = fileref.tag
      tag.title
    end
    y = TagLib::FileRef.open(self.m_song.path) do |fileref|
      tag = fileref.tag
      tag.artist
    end
    x = TagLib::FileRef.open(self.m_song.path) do |fileref|
      tag = fileref.tag
      tag.album
    end
    w = TagLib::FileRef.open(self.m_song.path) do |fileref|
      properties = fileref.audio_properties
      properties.length
    end
    if title.nil?
      self.update_attributes(:title => z)
    elsif artist.nil?
      self.update_attributes(:artist => y)
    elsif ep_title.nil?
       self.update_attributes(:ep_title => x) 
    elsif length.nil?
      self.update_attributes(:length => w)
    else
    end
  end



 private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items still present')
      return false
    end
  end
end
