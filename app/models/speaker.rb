class Speaker < ActiveRecord::Base

  has_and_belongs_to_many :talks
  [:first_name, :last_name, :email, :bio].each do |field|
    validates field, :presence => true
  end

  validates_length_of :bio, :maximum => 800

  db_image_accessor :db_image

  before_create AddConfYear

end
