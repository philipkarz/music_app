class AddAttachmentCovimgToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :covimg
    end
  end

  def self.down
    remove_attachment :users, :covimg
  end
end
