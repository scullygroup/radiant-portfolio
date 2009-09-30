class Tag < ActiveRecord::Base
  
  has_and_belongs_to_many :projects
  
  validates_presence_of :tag
  
  #attr_accessible :tag
end
