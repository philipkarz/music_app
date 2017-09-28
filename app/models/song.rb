class Song < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all

  has_attached_file :songpath,
  default_url: "/songs/:style/missing_file.mp3"
  do_not_validate_attachment_file_type :songpath
  # validates_attachment_content_type :songpath,
  # content_type: [
  #   'application/mp3',
  #   'application/x-mp3',
  #   'audio/mpeg',
  #   ['audio/mpeg'], # note the array around the type
  #   'audio/mp3'
  # ],
  # message: 'File must be of filetype .mp3'
  # validates_attachment_content_type :songpath, content_type: [ 'application/mp3', 'application/x-mp3','audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ], message: "wrong type of file"
end
