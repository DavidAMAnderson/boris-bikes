require 'spec_helper'

  describe DockingStation do

   it { is_expected.to respond_to :release_bike}

    it { is_expected.to respond_to(:bike) }

    it { is_expected.to respond_to(:dock).with(1).argument }

    #it 'returns docked bikes' do
    #  bike = Bike.new
    #  subject.dock(bike)
    #  expect(subject.release_bike).to eq bike
    #end

    describe '#docking_station' do
      it 'should raise an error if no bikes available' do
        expect{subject.release_bike}.to raise_error("error - no bikes available")
      end
    end

    describe '#dock' do
      it "should not accept more bikes than its capacity" do
        DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
        expect{subject.dock Bike.new}.to raise_error("error - docking station has exceeded capacity")
      end
    end

    describe '#initialize' do
      it "should not accept more bikes than newly specified capacity" do
        subject.capacity.times { subject.dock Bike.new}
        expect{subject.dock(Bike.new)}.to raise_error("error - docking station has exceeded capacity")
      end

      it "should not accept more bikes than 50" do
        docking_station = DockingStation.new(50)
        50.times {docking_station.dock Bike.new}
        expect{docking_station.dock(Bike.new)}.to raise_error("error - docking station has exceeded capacity")
      end

      it 'has a default capacity' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end
    end

    # describe '#release_bike' do
      # it "should not release broken bikes" do
      #   bike = Bike.new
      #   bike.report_broken
      #   subject.dock(bike)
      #   expect {subject.release_bike}.to raise_error("Bike is broken")
      # end
    # end

    # describe '#release_broken_bike' do
    #   it "should only release broken bikes to the van" do
    #   bike = double(:bike, broken: false)
    #   subject.dock(bike)
    #   expect {subject.release_broken_bike}.to raise_error("Bike is not broken")
    #   end
    # end
  end
