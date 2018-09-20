class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.integer :street_number
      t.string :street_name
      t.string :city
      t.integer :postal_code
      t.string :state
      t.string :country
      t.integer :monthly_rent
      t.string :bm_name
      t.string :bm_phone
      t.string :bm_contact
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
