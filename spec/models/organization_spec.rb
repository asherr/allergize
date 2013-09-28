require 'spec_helper'

describe Organization do

  before { @organization = Organization.create(name: "Test Org") } 

  describe "#lookup_by_name" do

    it "should return the organization" do
      expect(Organization.lookup_by_name("Test")).to include @organization
    end
  end
end
