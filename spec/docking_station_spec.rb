require 'docking_station'

describe DockingStation do

  describe '#release_bike' do
      it 'should fail when theres no bikes left' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
    end
      it 'shouldnt release a bike if it is broken' do
        blue_bike = double(:bike)
        blue_bike.report_broken
        subject.dock(blue_bike)
     expect { subject.release_bike }.to raise_error 'Broken bike'
   end
 end

  describe '#dock' do
    it 'should fail when we try dock a bike in a full docking station' do
      subject.capacity.times { subject.dock(double(:bike)) }
      expect { subject.dock(double(:bike)) }.to raise_error 'Docking station full'
    end
  end



#it "produces working bikes" do
#  red = Bike.new
#  expect(red).to be_working
#  end

it "has a default capacity" do
  expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
end

  describe "initialization" do
    it "has a variable capacity" do
      docking_station = DockingStation.new(50)
      50.times {docking_station.dock double(:bike)}
      expect {docking_station.dock double(:bike)}.to raise_error "Docking station full"
    end
  end


=begin
it "docking a bike returns the bike" do
  green_bike = Bike.new
  expect(subject.dock(green_bike)).to eq green_bike
end

it "bike method returns the bike we docked" do
  yellow_bike = Bike.new
  subject.dock(yellow_bike)
  expect(subject.bikes).to eq yellow_bike
end
=end

end
