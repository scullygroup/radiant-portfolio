class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :location
      t.integer :project_id
      t.integer :position

      t.timestamps
    end
    
    create_table :tags do |t|
      t.string :tag

      t.timestamps
    end
    
    create_table :projects do |t|
      t.string :title
      t.string :company
      t.string :url
      t.text :body
      t.string :thumb
      t.integer :order
      t.integer :active

      t.timestamps
    end
    
    create_table :projects_tags do |t|
      t.string :project_id
      t.string :tag_id
    end
  end

  def self.down
    drop_table :images
    drop_table :tags
    drop_table :projects
    drop_table :projects_tags
  end
end