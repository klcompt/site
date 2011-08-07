class Service < ActiveRecord::Base
  belongs_to :user
  attr_accessible :provider, :uid, :uname, :uemail

  [:provider, :uid, :uname].each do |field|
    validates field, :presence => true
  end

end
