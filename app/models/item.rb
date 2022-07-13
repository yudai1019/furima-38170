class Item < ApplicationRecord
  validates :name ,presence: true
  validates :description_item, presence: true
  validates :category_id , presence: true
  validates :state_id , presence: true
  validates :load_id  , presence: true
  validates :area_id, presence: true
  validates :date_time_id , presence: true
  validates :price ,format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/}, presence: true, numericality: { in: 300..9999999 }       
  validates :user , presence: true


  belongs_to :user 
  has_one :order
  has_one_attached :image

end

