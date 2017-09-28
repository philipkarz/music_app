class AddAttachmentSongcovimgToSongs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :songs do |t|
      t.attachment :songcovimg
    end
  end

  def self.down
    remove_attachment :songs, :songcovimg
  end
end
