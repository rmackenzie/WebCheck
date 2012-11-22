class AddHtmlToCourses < ActiveRecord::Migration
  def up
    add_column :courses, :html_source, :string
  end
  
  def down
    remove_column :courses, :html_source
  end
end
