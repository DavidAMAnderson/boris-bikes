require 'spec_helper'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks something' do
    bike = double(:bike)
    expect(subject.dock(bike)).to match_array(@ bike)
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when releasing a broken bike' do
      bike = double(:bike)
      docking_station = DockingStation.new
      bike.is_broken
      docking_station.dock(bike)
      expect { docking_station.release_bike }.to raise_error 'This bike is broken'
    end

    it 'releases a working if there is a broken bike' do
      broken_bike = double(:bike)
      broken_bike.is_broken
      docking_station = DockingStation.new
      docking_station.dock(broken_bike)
      working_bike = double(:bike)
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
    it 'should have a variable capacity fi. 50' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock double(:bike) }
      expect { docking_station.dock double(:bike) }.to raise_error 'Docking station full'
    end

    subject { DockingStation.new}
    let(:bike) {double(:bike)} # bike = double(:bike)
    it 'Defaults capacity' do
      DockingStation::DEFAULT_CAPACITY.times {subject.dock(bike)}
      expect{subject.dock(bike)}.to raise_error 'Docking station full'
    end
  end

end
