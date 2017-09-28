class AddAttachmentSongpathToSongs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :songs do |t|
      t.attachment :songpath
    end
  end

  def self.down
    remove_attachment :songs, :songpath
  end
end
