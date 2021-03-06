require File.dirname(__FILE__) + '/../spec_helper'

describe Preference do  
  fixtures :preferences
  
  describe ".get" do
    it "should return correct value" do
      Preference.get("name", true).should eql("Untitled Mouth Blog")
    end
  end
  
  describe ".set" do
    it "should set a new preference" do
      lambda do
        Preference.set("newpreference", "value")
      end.should change { Preference.count }
    end
    
    it "should save a new value to an old preference" do
      lambda do
        Preference.set("name", "My Site").should eql("My Site")
      end.should_not change { Preference.count }
      Preference.get("name", true).should eql("My Site")
    end
  end
  
  describe ".update_many" do
    it "should update many rows of preferences" do
      preferences = {
        :name   => 'testing',
        :theme  => 'testing',
        :url    => 'http://local.testing'
      }
      lambda do
        Preference.update_many(preferences)
      end.should change { Preference.get("theme", true) }
    end
  end
  
  describe "#to_key_and_value_pair" do
    it "should grab preferences and return key and pair value" do
      preferences = Preference.all.to_key_and_value_pair
      preferences.should include([preferences(:theme).name, preferences(:theme).value])
    end
  end
end