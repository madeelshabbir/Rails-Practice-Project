class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :house
      t.string :street
      t.string :area
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
