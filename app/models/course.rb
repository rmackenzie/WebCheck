
require 'url_validator'

class Course < ActiveRecord::Base
  
  belongs_to :user
  attr_accessible :name, :weblink, :html_source, :updated
  
  validates :name, :presence => true
  validates :weblink, :presence => true, :url => true
  
end
