class SongListen < ActiveRecord::Base
	tracked
	
    belongs_to :listenable, :polymorphic => true, :counter_cache => true
    belongs_to :user

    def attachable_type=(sType)
     super(sType.to_s.classify.constantize.base_class.to_s)
    end
end
