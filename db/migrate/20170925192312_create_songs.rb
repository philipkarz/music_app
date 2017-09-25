class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :genre
      t.string :songpic
      t.string :songfile
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
