class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :id, :primary_key => true
      t.text :blog, :limit => 50
      t.integer :me_id, :null => false, :references => [:me, :id]
      t.timestamps
    end
  end
end
