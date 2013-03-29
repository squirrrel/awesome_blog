class Renaming < ActiveRecord::Migration
  def self.up
      rename_table :me, :mes
    end

   def self.down
      rename_table :me, :mes
   end
end
