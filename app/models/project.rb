class Project < ActiveRecord::Base
  has_many :images, :order => :position, :dependent => :destroy 
  has_and_belongs_to_many :tags
  
  file_column :thumb, :magick => {:versions => {
         :thumb => {:size => "150x100", :name => "thumb"}
         }
       }
end
