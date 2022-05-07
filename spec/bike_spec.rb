require_relative '../lib/boris_bike.rb'

describe Bike do

  it 'Check object is an instance of Bike' do
    bike = Bike.new
    expect(bike).to be_an_instance_of(Bike)
  end

  it { expect(Bike.new.working?(true)).to be_truthy }
  it { expect(Bike.new.working?(false)).to be_falsey }
end
