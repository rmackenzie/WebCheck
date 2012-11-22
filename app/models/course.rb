class Course < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :weblink, :html_source, :updated
  

end
