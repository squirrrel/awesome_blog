class Blogs < ActiveRecord::Base
 #  attr_accessible :blog
   belongs_to :me
   has_many :posts, :foreign_key => 'blog_id', :class_name => 'Posts'

end
