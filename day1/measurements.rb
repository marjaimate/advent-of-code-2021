class Measure
  def initialize(file_name)
    @measurements = File.readlines(file_name)
  end

  def get_increases
    @measurements.each_cons(2).map do |a, b|
      b.to_i > a.to_i ? 1 : 0
    end.inject(:+)
  end
end

task = Measure.new("input1.txt")
puts task.get_increases
