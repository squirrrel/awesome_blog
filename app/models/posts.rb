class Posts < ActiveRecord::Base
  belongs_to :blogs
  # attr_accessible :title, :post
end
