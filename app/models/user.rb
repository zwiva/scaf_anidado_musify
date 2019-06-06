class User < ApplicationRecord
    # 1
    has_many :playlists
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
