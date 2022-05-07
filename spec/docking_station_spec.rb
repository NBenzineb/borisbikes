require_relative '../lib/boris_bike'

describe DockingStation do

  it 'checks if bikes are docked' do
    docking_station = DockingStation.new
    expect(docking_station.no_of_bikes).to be_an_instance_of(Integer)
  end

  it 'docks the bike to the station' do
    docking_station = DockingStation.new
    bike = Bike.new
    expect(docking_station.dock(bike).length).to be > 0
  end

  it 'No bikes available in docking station' do
    docking_station = DockingStation.new
    expect{docking_station.release_bike}.to raise_error("There are no bikes available")
  end

  it 'Provide a Bike instance if available in docking station' do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock(bike)
    expect(docking_station.release_bike).to be_an_instance_of(Bike)
  end

  it 'Cant accept more bikes at full capacity' do 
    docking_station = DockingStation.new
    bike = Bike.new 
    docking_station.DEFAULT_CAPACITY.times { docking_station.dock (bike) }
    expect{docking_station.dock(bike)}.to raise_error("No more spaces to dock bike")
  end

  it 'Change capacity' do 
    docking_station = DockingStation.new
    expect(docking_station.capacity(25)).to eq 25
  end

  it 'default capacity should eq 20' do
    docking_station = DockingStation.new
    expect(docking_station.capacity).to eq 20
  end

  it 'broken bikes to not be released' do 
    docking_station =DockingStation.new
    bike = Bike.new
    bike.report_broken
    docking_station.dock(bike)
    expect(docking_station.release_bike).to be_falsey
  end 
end
