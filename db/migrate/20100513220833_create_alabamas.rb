class CreateAlabamas < ActiveRecord::Migration
  def self.up
    create_table :alabamas do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :alabamas
  end
end
