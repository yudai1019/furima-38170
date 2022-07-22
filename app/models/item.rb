class Item < ApplicationRecord
  
validates :name, presence: true
 validates :description_item, presence: true
 validates :category_id, presence: true, numericality: { other_than: 1 }
 validates :state_id, presence: true, numericality: { other_than: 1 }
 validates :load_id, presence: true, numericality: { other_than: 1 }
 validates :area_id, presence: true, numericality: { other_than: 1 }
 validates :wait_id, presence: true, numericality: { other_than: 1 }
 validates :price, presence: true, numericality: { with: /\A[0-9]+\z/ },
                   numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
 validates :image, presence: true
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :load
  belongs_to :area
  belongs_to :wait
end
