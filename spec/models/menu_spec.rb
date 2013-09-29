require 'spec_helper'

describe Menu do
  #fixures :all
  before { @menu = Menu.find_by_name("Diner") }

  describe "#frequency_can_eat" do

    it "should count what you can eat with one assurance" do
      assu = Assurance.find_by_name("dairy free")
      count = @menu.frequency_can_eat([assu.id])
      expect(count).to eq 6
    end

    it "should count what you can eat with more than one assurance" do
      assus = []
      assus << Assurance.find_by_name("dairy free")
      assus << Assurance.find_by_name("egg free")
      count = @menu.frequency_can_eat(assus.map(&:id))
      expect(count).to eq 3
    end
  end

end
