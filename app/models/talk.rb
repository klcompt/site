class Talk < ActiveRecord::Base

  [:title, :abstract, :video_approval, :talk_type].each do |field|
    validates field, :presence => true
  end

  has_and_belongs_to_many :speakers

  accepts_nested_attributes_for :speakers

  def self.video_approvals
    ["Yes", "No", "Maybe"]
  end

  def self.talk_types
    ["Deep Dive", "Intro", "Survey", "Other", "Strange Passions", "Panel"]
  end

  validates_inclusion_of :video_approval, :in => video_approvals
  validates_inclusion_of :talk_type, :in => talk_types

  validates_length_of :title, :maximum => 55
  validates_length_of :abstract, :maximum => 2000

  acts_as_taggable_on :tags

  accepts_nested_attributes_for :tags
  
end
