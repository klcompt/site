require 'spec_helper'

describe ConferenceSession do
  let(:talk) { Factory(:talk) }
  let(:conference_session) { ConferenceSession.new(:talk => talk) }

  it "should auto add the current year as conf_year" do
    conference_session.conf_year.should == Time.now.year
  end

  context "validations" do
    
    it "rejects empty format" do
      ConferenceSession.new(:format => '').should_not be_valid
    end

    it "rejects invalid format" do
      ConferenceSession.new(:format => 'heynow').should_not be_valid
    end

    context "the simplest form" do

      it "is valid with just a talk and no format" do
        conference_session.should be_valid
      end

      it 'has an undefined format by default' do
        conference_session.format.should == 'undefined'
      end
    end

    %w(workshop keynote talk lightning undefined).each do |talk_format|
      context "talk format validation" do
        let(:session) { ConferenceSession.new(:talk => Factory(:talk), :format => talk_format) }
        it "is valid with talk and #{talk_format}" do
          session.should be_valid
        end

        it "knows its format" do
          session.format.should == talk_format
        end
      end
    end
  end

  it {should belong_to :talk}
  it {should belong_to :slides}

  it "gets its title from its talk" do
    conference_session.title.should == talk.title
  end

  it "knows all conference years on record" do
    Factory(:last_years_talk_session)
    Factory(:talk_session)
    current_year = Time.now.year
    ConferenceSession.all_years.should == [current_year, current_year - 1]
  end

  context "#from_year" do
    let(:current_year_session) { Factory(:talk_session) }
    let(:last_years_session) { Factory(:last_years_talk_session) }

    before do
      current_year_session
      last_years_session
    end

    it "defaults to current year" do
      ConferenceSession.from_year.should == [current_year_session]
    end

    it "retrieves sessions based on year param" do
      ConferenceSession.from_year((Time.now.year - 1).to_s).should == [last_years_session]
    end
  end
end

