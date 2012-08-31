class FanBase < ActiveRecord::Base
  tracked 
  #pretty urls
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  validates_acceptance_of :terms
  validates :name, :user_id, :type_of_music_entity, :presence => true
  attr_accessible :name, :user_id, :type_of_music_entity, :fb_art


  has_attached_file :fb_art, :styles => { :medium => "300x300>", :medium2 => "200x200>", :thumb => "100x100>", :thumb_small => "50x50>" },
   :storage => :s3,
   :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename"



  validates :fb_art, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :fb_art
  
  has_many :events
  belongs_to :user
  has_one :label, :foreign_key => "fan_base_id"
  
  has_many :fan_relationships, foreign_key: :followed_id 
  has_many :fan_base_followers, through: :fan_relationships, source: :follower

  #searchable do
   # text :name
    #integer :id
  #end

  include Tire::Model::Search
  include Tire::Model::Callbacks
 
  def self.search(params)
    tire.search(load: true) do
      query { string params[:query] } if params[:query].present?
    end
  end
 

    def self.from_users_followed_by(user)
      following_ids = %(SELECT followed_id FROM fan_relationships
                        WHERE follower_id = :user_id)
      where("user_id IN (#{following_ids}) OR user_id = :user_id",
            { :user_id => user })
    end

  def number_of_songs
  	self.user.master_songs.count
   end

#recetly joined fans
  def recently_joined
  	self.fan_base_followers.limit(5)
  end

  def total_fans
    self.fan_base_followers.count
  end

#total up votes in fan base
  def total_upvotes
    self.user.master_songs.sum(:song_up_votes_count)
  end


#recently added songs to fan base
  def recently_added_master_songs
    self.user.master_songs.limit(10).order(:created_at)
  end
end
