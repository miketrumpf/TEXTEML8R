class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string  :content
      t.string :from_number
      t.string :to_number
      t.integer :user_id
      t.integer :contact_id


      t.timestamps

    end
  end
end
