require 'spec_helper'

describe AttendeeCred do

  [:password, :email].each do |field|
    it {should validate_presence_of field}
  end

end
