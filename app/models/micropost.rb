class Micropost < ActiveRecord::Base
	attr_accessible :content

	belongs_to :user

	validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true

	default_scope :order => 'microposts.created_at DESC'

	 # Return microposts from the users being followed by the given user.


  private

    def self.from_users_followed_by(user)
    following_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{following_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
  #  searchable do
 #     text :micropost
 #   end
      
end

#not sure if we'll have microposts - too twittr like, spac enot needed in market

#Should you follow the person who created the fan base? Maybe a choice

#goal: find the microposts of the user who owns the fan base
#user.fan_relationships.fan_base.user.microposts.all
