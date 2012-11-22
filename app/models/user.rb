class User < ActiveRecord::Base
  attr_accessible :name, :pass
  
  has_many :courses, :dependent => :destroy
end
