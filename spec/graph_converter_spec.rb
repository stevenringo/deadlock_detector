$:.unshift File.expand_path('../lib', __FILE__)
require 'deadlock_detector/graph_converter'

module DeadlockDetector
  describe "Supplied input format is converted to the form [[from_node, to_node],...] for analysis" do
    it "converts supplied example" do
      example = [
        [1, 1, 'H'],
        [1, 2, 'W'],
        [2, 1, 'W'],
        [2, 2, 'H']
      ]
      GraphConverter.convert(example).should =~ [[1, 2], [2, 1]]
    end

    it "converts contrived example" do
      example = [
        [1 , 1, 'W'],
        [2 , 2, 'W'],
        [1 , 2, 'H'],
        [6 , 2, 'H'],
        [3 , 3, 'W'],
        [4 , 3, 'W'],
        [5 , 3, 'W'],
        [2 , 3, 'H'],
        [3 , 4, 'H'],
        [4 , 5, 'H'],
        [6 , 6, 'W'],
        [5 , 6, 'H']
      ]
      GraphConverter.convert(example).should =~ [[2, 1], [2, 6], [3, 2], [4, 3], [5, 3], [6, 3]]
    end
  end
end



