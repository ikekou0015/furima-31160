class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string  :postal_code,       default: "",     null: false
      t.integer :prefecture_id,                      null: false
      t.string  :city,              default: ""
      t.string  :addresses,         default: ""   
      t.string  :building,          default: ""
      t.string  :phone_number,      default: "",     null: false
      t.references :order,                           foreign_key: true 
      t.timestamps
    end 
  end
end
