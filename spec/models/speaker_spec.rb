require 'spec_helper'

describe Speaker do
  [:first_name, :last_name, :email, :bio].each do |field| 
    it {should validate_presence_of field}
  end

  it {should allow_value("MO").for(:state)}
  it {should allow_value("IL").for(:state)}
  it {should allow_value("CA").for(:state)}

  it {should allow_value("US").for(:country)}
  it {should allow_value("CA").for(:country)}

  let!(:model){Factory(:speaker)}

  it "should auto add the current year as conf_year" do
    model.conf_year.should == Time.now.year
    model.db_image.data.should == SpeakerImage.find_by_uid(model.db_image_uid).db_image
  end

  it {should allow_value("123-456-7891").for(:phone)}
  it {should allow_value("1234567891").for(:phone)}

  it{ should_not allow_value("x" * 801).for(:bio)}
end
