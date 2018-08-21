require 'spec_helper'
describe  ToySimulator do

  let(:toy) { ToySimulator.new(["PLACE", "1,2,EAST"]) }

  describe '#init' do
    it '#set the pos and returns the face of robot' do
    	expect(toy.instance_variable_get('@face')).to eq('EAST')
    end
  end 

  describe '#nstep' do 
    it '#return next move side' do
      expect(toy.nstep('LEFT')).to eq('NORTH')
    end    
  end
  
  describe '#move' do
    it '#get the next move' do
      toy.move
      expect(toy.instance_variable_get('@y_cord')).to eq(2)
    end
  end 

  describe '#valid_position?'  do 
    it '#object should not fall from the surface' do 
      expect(toy.valid_position?).to be(true)
    end
  end

  describe '#expected result' do
    it '#nstep should return' do 
      moves = ['MOVE', 'MOVE', 'LEFT', 'MOVE', 'REPORT']
      moves.each do | i |
        toy.nstep(i)
      end      
     expect(toy.instance_variable_get('@x_cord')).to eq(3)
     expect(toy.instance_variable_get('@y_cord')).to eq(3)
     expect(toy.instance_variable_get('@face')).to eq('NORTH')    
    end
  end

end

