class PortfolioImage < ActiveRecord::Base
  
  belongs_to :project
  
  has_attached_file :image,
                    :url => "/portfolio/:id/:style/:basename.:extension",
                    :styles => { :thumb => '100x100#', :medium => '666x357' }

  validates_attachment_presence     :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png']
  
  validates_presence_of :project_id
  
end
