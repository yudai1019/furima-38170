class Date_time < Activehash::Base
  
  self.date = [
    {id:1,date_time:'---' },
    {id:2,date_time:'1~2日で発送' },
    {id:3,date_time:'2~3日で発送' },
    {id:4,date_time:'4~7日で発送' },
    
  ]
 
  include ActiveHash::Associations
  has_many :articles

  end