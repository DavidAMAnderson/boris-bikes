require 'spec_helper'

describe Van do

  it { is_expected.to respond_to(:load_bike).with(1).argument }

  it "loads a working bike" do
    bike = Bike.new
    van_before = subject.working_bikes.count
    subject.load_bike(bike)
    van_after = subject.working_bikes.count
    expect(van_after > van_before).to eq(true)
  end

  it "loads a broken bike" do
    bike = Bike.new
    bike.report_broken
    van_before = subject.broken_bikes.count
    subject.load_bike(bike)
    van_after = subject.broken_bikes.count
    expect(van_after > van_before).to eq(true)
  end

    it 'should raise an error if no working bikes available' do
      expect{subject.unload_bike_docking_station}.to raise_error("error - no bikes available")
    end

    it 'should raise an error if no broken bikes available' do
      expect{subject.unload_bike_garage}.to raise_error("error - no bikes available")
    end
end
