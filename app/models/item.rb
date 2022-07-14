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
  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 } 
  validates :load_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :date_time_id, numericality: { other_than: 1 } 

  belongs_to :user
  has_one :order
  has_one_attached :image
  include ActiveHash::Associations
  has_one :category
  has_one :state
  has_one :load
  has_one :area
  has_one :date_time
  

end

