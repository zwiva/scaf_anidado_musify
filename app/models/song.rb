class Song < ApplicationRecord
  belongs_to :playlist
  #7 
  validates :name, presence: true
  validates :artist, presence: true

end
