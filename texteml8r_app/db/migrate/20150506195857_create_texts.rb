class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string  :content
      t.string :phone_number
      t.datetime :time
      t.integer :user_id
      t.integer :contact_id
      



      t.timestamps

    end
  end
end
