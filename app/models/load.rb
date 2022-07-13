class Load < Activehash::Base
  
  self.date = [
    {id:1,load:'---' },
    {id:2,load:'着払い(購入者負担)' },
    {id:3,state:'送料込み(出品者負担)' }
    
  ]
 
  include ActiveHash::Associations
  has_many :articles

  end