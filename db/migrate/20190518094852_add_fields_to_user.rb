class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.boolean :is_lender, default: false, null: false
      t.text :address, default: ""
      t.string :pincode, default: ""
      t.string :country, default: ""
      t.string :state, default: ""
      t.string :city, default: ""
      t.text :about, default: ""
      t.string :profession, default: ""
      t.string :phone, default: ""
    end
  end
end
