class Playlist < ApplicationRecord
  # 2
  belongs_to :user
  #   7
  has_many :songs
  # 2
  validates :name, presence: true, uniqueness: true
  
end
