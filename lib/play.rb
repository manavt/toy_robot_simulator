require_relative 'toy_simulator'
pos = ARGV.shift(2)
t = ToySimulator.new(pos)
ARGV.each do | steps |
  t.nstep(steps)
end
