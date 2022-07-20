class Item < ApplicationRecord
  

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
