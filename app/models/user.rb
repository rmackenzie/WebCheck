class User < ActiveRecord::Base
  attr_accessible :name, :pass
  
  validates :name, :presence => true, :uniqueness => true, :length => {:minimum => 5}
  validates :pass, :presence => true, :length => {:minimum => 6}
    
  has_many :courses, :dependent => :destroy
  
  def self.authenticate(name, pass)
    user = find_by_name(name)
    if user && user.pass == pass
      user
    else
      nil
    end
  end

end
