class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :load
  belongs_to :area
  belongs_to :date_time

  validates :category_id, numericality: { other_than: 1 } 
  validates :state_id, numericality: { other_than: 1 } 
  validates :load_id, numericality: { other_than: 1 } 
  validates :area_id, numericality: { other_than: 1 } 
  validates :date_time_id, numericality: { other_than: 1 } 

  end

end
