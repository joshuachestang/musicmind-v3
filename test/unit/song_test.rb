require 'test_helper'

class SongTest < ActiveSupport::TestCase
   test "song must not be empty" do
   	song=Song.new
     assert song.invalid?
     assert song.errors[:title].any?
     assert song.errors[:artist].any?
     assert song.errors[:album].any?
   end
end
