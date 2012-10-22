class User < ActiveRecord::Base
#unread gem for notificaitons
  acts_as_reader

#friendly url helper
  extend FriendlyId
  friendly_id :username

  #searchable do 
   # text :username
    #text :name
    #text :email
  #end

  validates_acceptance_of :terms

  validates :user_type, presence: true
  validates :username, uniqueness: true
  has_attached_file :user_image, :styles => { :medium => "300x300>", :thumb => "100x100>", :medium2 => "150x150>", :thumb_small => "50x50>" }

  #, :storage => :s3,
   # :s3_credentials => "#{Rails.root}/config/s3.yml",
    # :path => "/:style/:id/:filename"

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username,
                  :user_image, :user_type, :provider, :uid, :account_balance

  
  cattr_accessor :current_user

  attr_accessor :account_balance
 # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
   # Setup accessible (or protected) attributes for your model
  
  #validates :image_url, allow_blank: true, format: {
   #    with: %r{\.(gif|jpg|png)$}i,
    #  message: 'is not correct.'
  #}

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end

def self.new_with_session(params, session)
  if session["devise.user_attributes"]
    new(session["devise.user_attributes"], without_protection: true) do |user|
      user.attributes = params
      user.valid?
    end
  else
    super
  end
end

def password_required?
  super && provider.blank?
end

def update_with_password(params, *options)
  if encrypted_password.blank?
    update_attributes(params, *options)
  else
    super
  end
end

include Tire::Model::Search
include Tire::Model::Callbacks

  def self.search(params)
    tire.search do
      query { string params[:query] } if params[:query].present?
    end
  end

  #song_up_votes
  has_many :song_up_votes, :foreign_key => "user_id"
  #song_listens
  has_many :song_listens, :foreign_key => "user_id"
  #user_purchase_account
  has_one :user_purchase_account, :foreign_key => "user_id"

  #user_song_uploads 
  has_many :user_song_uploads, :foreign_key => "user_id"

  #fan_base_for_user
  has_one :fan_base, :foreign_key => "user_id", dependent: :destroy
  has_many :fan_relationships, foreign_key: :follower_id, :dependent => :destroy
  has_many :fan_base_followings, through: :fan_relationships, source: :followed
  

  #master_song_relationships
  has_many :master_songs, :foreign_key => "user_id"
  has_many :master_song_relationships, foreign_key: :owner_id
  has_many :master_song_ownings, through: :master_song_relationships, source: :owned
  #has_many :owning, :through => :master_song_relationships, :source => :owned

  #albums
  has_many :albums, foreign_key: :user_id

  #comments on master songs
  has_many :master_song_comments, foreign_key: :user_id
  #microposts  
  has_many :microposts, foreign_key: :user_id, :dependent => :destroy
  
  #relationships
  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :following, :through => :relationships, :source => :followed

  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end


#checks if user upvoted a song/collects
  def up_voted_song?(master_song)
     song_up_votes.find_by_master_song_id(master_song)
  end

  def owning?(master_song)
    master_song_ownings.find_by_owned_id(master_song)
  end

  def feed
    Micropost.from_users_followed_by(self)
  end

  def notifications
    MasterSong.from_users_followed_by(self)
  end

#who is the user following
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

#follow another user
  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end 

#unfollow another user
  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

#find songs that the user owns(has purchased or added from master library)
  def owning?(owned)
    master_song_relationships.find_by_owned_id(owned)
  end

#purchase a song/add it to user library
  def own!(owned)
    master_song_relationships.create!(:owned_id => owned.id)
  end

#user takes purchased song out of library
  def unown!(owned)
    master_song_relationships.find_by_master_song_owned_id(owned).destroy
  end

#is urser following this selected fan base?
  def fan_base_following?(followed)
    fan_relationships.find_by_followed_id(followed)
  end

#become a fan in this fan base
  def follow_fan_base!(followed)
    fan_relationships.create!(:followed_id => followed.id)
  end

#leave this fan base
  def unfollow_fan_base!(followed)
    fan_relationships.find_by_followed_id(followed).destroy
  end

#how many fan bases is this user in
  def number_of_fan_bases
    self.fan_relationships.count
  end

#how many songs does has this user added from the master library(master_songs)
  def master_song_relationships_total
    self.master_song_relationships.count
  end

#how many songs has this user uploaded
  def user_song_uploads_total
    self.user_song_uploads.count
  end

#total amount of songs in user's library
  def total_songs
    self.master_song_relationships.count + self.user_song_uploads.count
  end

#total amount of songs the user has upvoted
  def total_up_votes
    self.song_up_votes.size
  end

end

