class Project < ActiveRecord::Base
    
  has_many :portfolio_images, :order => :position, :dependent => :destroy 
  has_and_belongs_to_many :tags
       
  has_attached_file :thumb,
                    :url => "/portfolio/:id/:style/:basename.:extension",
                    :styles => { :thumb => '150x100#' }
  
  #attr_accessible :title, :company, :url, :body, :thumb, :order, :active, :tag_ids
  
  validates_attachment_presence     :thumb
  validates_attachment_content_type :thumb, :content_type => ['image/jpeg', 'image/gif', 'image/png']
  
  validates_presence_of :title, :company, :url, :body
end

