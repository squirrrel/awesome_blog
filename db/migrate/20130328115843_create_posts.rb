class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :id, :primary_key => true
      t.string :title, :limit => 40
      t.text :post, :limit => 1600
      t.integer :blog_id, :null => false, :references => [:blogs, :id]
      t.timestamps
    end
  end
end
