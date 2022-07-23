class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t| 
      t.string  :postnum,      null: false
      t.integer :area_id,      null: false
      t.string  :municipality, null: false
      t.string  :addressnum ,  null: false
      t.string  :bulidingname 
      t.string  :phonenum,     null: false 
      t.references :order,     null: false, foreign_key: true
      t.timestamps
    end
  end
end




