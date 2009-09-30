class CreateTables < ActiveRecord::Migration
  def self.up
    create_table  :portfolio_images do |t|
      t.integer   :project_id
      t.integer   :position
      t.string    :image_file_name
      t.string    :image_content_type
      t.integer   :image_file_size
      t.datetime  :image_updated_at

      t.timestamps
    end
    
    create_table  :tags do |t|
      t.string    :tag

      t.timestamps
    end
    
    create_table  :projects do |t|
      t.string    :title
      t.string    :company
      t.string    :url
      t.text      :body
      t.string    :thumb_file_name
      t.string    :thumb_content_type
      t.integer   :thumb_file_size
      t.datetime  :thumb_updated_at
      t.integer   :order
      t.integer   :active

      t.timestamps
    end
    
    create_table  :projects_tags, :id => false do |t|
      t.string    :project_id
      t.string    :tag_id
    end
  end

  def self.down
    drop_table :portfolio_images
    drop_table :tags
    drop_table :projects
    drop_table :projects_tags
  end
end