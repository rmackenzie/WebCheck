class AddUpdatedToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :updated, :boolean
  end
end
