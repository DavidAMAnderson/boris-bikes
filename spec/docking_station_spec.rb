require 'spec_helper'

describe DockingStation do
  # it {is_expected.to respond_to :release_bike}

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#release_bike' do
  #   it 'raises an error when there are no bikes available' do
  #     expect { subject.release_bike }.to raise_error 'No bikes available'
  #   end

    # it 'raises an error when releasing a broken bike' do
    #   bike = double(:bike)
    #   docking_station = DockingStation.new
    #   allow(bike).to receive(:broken).and_return(true)
    #   docking_station.dock(bike)
    #   expect { docking_station.release_bike }.to raise_error 'This bike is broken'
    # end

    it 'releases a working bike if there is a broken bike' do
      broken_bike = double(:bike)
      docking_station = DockingStation.new
      allow(broken_bike).to receive(:broken).and_return(true)
      docking_station.dock(broken_bike)
      working_bike = double(:bike)
      allow(working_bike).to receive(:broken).and_return(false)
      docking_station.dock(working_bike)
      expect(docking_station.release_working_bike).to eq(working_bike)
    end
  end

  describe '#dock' do
    it 'checks a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

  end

  describe 'initialization' do
    let(:bike) { double :bike }
    it 'should have a variable capacity fi. 50' do
      docking_station = DockingStation.new(50)
      allow(bike).to receive(:broken).and_return(false)
      50.times { docking_station.dock bike }
      expect { docking_station.dock bike }.to raise_error 'Docking station full'
    end

    subject { DockingStation.new}
    let(:bike) {double(:bike)} # bike = double(:bike)
    it 'Defaults capacity' do
      allow(bike).to receive(:broken).and_return(false)
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
      expect{subject.dock(bike)}.to raise_error 'Docking station full'
    end
  end

end
