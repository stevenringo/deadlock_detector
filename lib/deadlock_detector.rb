require "deadlock_detector/version"
require "deadlock_detector/graph_converter"
require "deadlock_detector/directed_graph"

module DeadlockDetector
  class Detector
    def self.validate(file)
      lines = File.open(file,'r').read
      input_array = []
      lines.each_line do |line|
        input_array << line.chomp.split(",")
      end
      directed_graph = GraphConverter.convert(input_array)
      DirectedGraph.new.has_loops?(directed_graph) ? "BAD" : "GOOD"
    end
  end
end
