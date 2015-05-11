class CreateAddTimeZoneToUsers < ActiveRecord::Migration
  def self.up
    add_column :texts, :time_zone, :string
  end

  def self.down
    remove_column :texts, :time_zone
  end
  
end
