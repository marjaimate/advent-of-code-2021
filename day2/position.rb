class Position
  attr_accessor :depth, :horizontal, :aim
  def initialize(file_name)
    @depth = @horizontal = @aim = 0
    @moves = File.readlines(file_name)
  end

  def process
    @moves.each do |move|
      type,unit =  move.split(" ")
      adjust(type, unit.to_i)
    end
  end

  def adjust(type, unit)
    if "forward" == type
      @horizontal += unit
    elsif "down" == type 
      @depth += unit
    elsif "up" == type
      @depth -= unit
    end
  end
  
  def process_with_aim
    @moves.each do |move|
      type,unit =  move.split(" ")
      adjust_with_aim(type, unit.to_i)
    end
  end

  def adjust_with_aim(type, unit)
    if "forward" == type
      @horizontal += unit
      @depth += (@aim * unit) 
    elsif "down" == type 
      @aim += unit
    elsif "up" == type
      @aim -= unit
    end
  end
end

task = Position.new("input.txt")
task.process
puts "Depth: #{task.depth}"
puts "Horizontal: #{task.horizontal}"
puts "#{task.depth * task.horizontal}"
puts "-------"
task = Position.new("input.txt")
task.process_with_aim
puts "Depth: #{task.depth}"
puts "Horizontal: #{task.horizontal}"
puts "#{task.depth * task.horizontal}"
