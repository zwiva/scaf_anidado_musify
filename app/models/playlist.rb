class Playlist < ApplicationRecord
  # 2
  belongs_to :user
  validates :name, presence: true, uniqueness: true

  #7
  has_many :songs
end
