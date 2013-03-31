class RebuildBlogs < ActiveRecord::Migration
  def up
    create_table :blogs do |t|
      t.integer :id, :primary_key => true
      t.string :blog, :limit => 50
      t.integer :me_id, :null => false, :references => [:mes, :id]
      t.timestamps
    end
  end

  def down
  end

end
