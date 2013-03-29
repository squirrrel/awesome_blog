class CreateMes < ActiveRecord::Migration
  def change
    create_table :me do |t|
     t.integer :id, :primary_key => true
      t.string :username, :limit => 10
      t.string :password, :limit => 15
      t.binary :ava
      t.timestamps
    end
  end
end
