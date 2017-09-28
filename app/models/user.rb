class User < ApplicationRecord
    has_secure_password
    has_many :songs
    has_many :comments
    validates_confirmation_of :password
    
    has_attached_file :avatar,
    styles: {medium: "300x300#", thumb: "100x100#"},
    :default_url => ActionController::Base.helpers.asset_path("missing.jpg")

    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    has_attached_file :covimg,
    styles: {user_cov: "800x300#"},
    :default_url => ActionController::Base.helpers.asset_path("missing_cover_photo.jpg")

    validates_attachment_content_type :covimg, content_type: /\Aimage\/.*\z/
end
