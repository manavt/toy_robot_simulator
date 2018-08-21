require 'byebug'
class ToySimulator
  DIRECTIONS = %w[WEST SOUTH EAST NORTH].freeze
  def initialize(args)
    if args.join(" ").match(/^(PLACE)\s?(\d?),?(\d?),(WEST|SOUTH|EAST|NORTH)?/i)
      # @x_cord, @y_cord will be 0 if positioned are not defined
      @x_cord = $2.to_i 
      @y_cord = $3.to_i
      @face =  $4 || 'EAST' # if no face given  
    else
      puts "params are not formed properly"
      exit() 
    end
  end
  def nstep(next_move)
    case next_move 
      when /report/i then report
      when /move/i then move
      when /left/i then turn('LEFT')
      when /right/i then turn('RIGHT')
    end
  end
  def move
    case @face
      when /north/i then @y_cord += 1
      when /south/i then @y_cord -= 1
      when /east/i then @x_cord += 1
      when /west/i then @x_cord -= 1
    end
    invalid_move unless valid_position?
  end

  def invalid_move
     # object should not fall from the surface
     puts "Invalid move!"
     exit()
  end
  def turn(direction)
    index = DIRECTIONS.index(@face)
    if direction.eql?('LEFT')
      @face = DIRECTIONS.rotate[index]
    elsif direction.eql?('RIGHT')
      @face = DIRECTIONS.rotate(-1)[index]
    end
  end
  
  def valid_position?
    #dimensions 5 units x 5 units
    return (@x_cord <= 5 &&
        @x_cord >= 0 &&
        @y_cord <= 5 &&
        @y_cord >= 0 &&
        DIRECTIONS.include?(@face))
  end
  
  def report
    puts [@x_cord, @y_cord, @face].join(',')
  end
end
