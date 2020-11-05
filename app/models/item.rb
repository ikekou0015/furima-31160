class Item < ApplicationRecord
  belongs_to :user 
  has_one_attached :image
   
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  validates :name, :info, presence: true
  validates :price, presence: true, format: { with: /\A[300-9999999]+\z/, messege: '半角数字で入力して下さい' }
  
  validates :category_id,            numericality:     { other_than: 1 }
  validates :sales_status_id,        numericality:     { other_than: 1 }
  validates :shipping_fee_status_id, numericality:     { other_than: 1 }
  validates :prefecture_id,          numericality:     { other_than: 1 }
  validates :scheduled_delivery_id,  numericality:     { other_than: 1 }
end
