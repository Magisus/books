class Book < ActiveRecord::Base
  
  validates_uniqueness_of :title, scope: :author
  
end
