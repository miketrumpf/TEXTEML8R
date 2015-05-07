class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :phone_number

      t.timestamps
    end
  end
end
