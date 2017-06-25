class CreateModel < ActiveRecord::Migration[5.1]
  def up
  	create_table :visits do |t|
  		t.string :instanceId
      t.integer :count
  	end
  end

  def down
  	drop_table :visits
  end
end
