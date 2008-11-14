class Image < ActiveRecord::Base
  
  file_column :location, :magick => {:versions => {
         :thumb => {:crop => "1:1",  :size => "100x100", :name => "thumb"},
         :medium => {:crop => "4:3", :size => "666x357", :name=>"medium"}
         }
       }
  belongs_to :project
  
end
