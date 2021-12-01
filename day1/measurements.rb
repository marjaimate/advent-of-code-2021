class Measure
  def initialize(file_name)
    @measurements = File.readlines(file_name).map(&:to_i)
  end

  def get_increases
    count_increases(@measurements)
  end

  def get_window_increases
    input = @measurements.each_cons(3).map do |a, b, c|
      a + b + c
    end
    count_increases(input)
  end

  def count_increases(input)
    input.each_cons(2).map do |a, b|
      b > a ? 1 : 0
    end.inject(:+)
  end
end

task = Measure.new("input1.txt")
puts "Increase count with window of 2: #{task.get_increases}"
puts "Increase count with window of 3: #{task.get_window_increases}"
