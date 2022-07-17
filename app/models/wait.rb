class Wait < ActiveHash::Base
  self.data = [
    { id: 1, wait: '---' },
    { id: 2, wait: '1~2日で発送' },
    { id: 3, wait: '2~3日で発送' },
    { id: 4, wait: '4~7日で発送' }

  ]
  include ActiveHash::Associations
  has_many :items
end
