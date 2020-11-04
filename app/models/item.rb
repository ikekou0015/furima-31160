class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  has_one_attached :image

  validates :name, :info, :price, presence: true
  
  validates :genre_id, numericality: { other_than: 1 }

end
