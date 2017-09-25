class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :profpic
      t.string :covpic
      t.string :chadress
      t.string :hometown
      t.text :bio
      t.string :website
      t.string :facebook
      t.string :instagram
      t.string :twitter
      t.string :spotify

      t.timestamps
    end
  end
end
