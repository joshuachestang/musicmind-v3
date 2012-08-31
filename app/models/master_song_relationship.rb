class MasterSongRelationship < ActiveRecord::Base

	tracked

	#searchable do
     # integer :owner_id
    #end
	
	attr_accessible :owned_id, :favorite

	belongs_to :owner, :class_name => "User"
    belongs_to :owned, :class_name => "MasterSong"

    validates :owner_id, :presence => true
    validates :owned_id, :presence => true

end
