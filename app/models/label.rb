class Label < ActiveRecord::Base
    validates :name, presence: :true
    validates :label_image, :attachment_presence => true
    validates_with AttachmentPresenceValidator, :attributes => :label_image

	belongs_to :fan_base, dependent: :destroy
	
	has_attached_file :label_image, :styles => { :medium => "300x300>", :thumb => "100x100>", :thumb_small => "50x50>" }, 
	:storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => "/:style/:id/:filename"

	attr_accessible :label_image, :fan_base_id, :name
end
