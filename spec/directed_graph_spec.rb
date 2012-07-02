$:.unshift File.expand_path('../lib', __FILE__)
require 'deadlock_detector/directed_graph'

module DeadlockDetector
  describe "Tarjan's algorithm to find connected nodes in directed graphs" do

    let(:directed_graph) {  DirectedGraph.new }

    it "finds 2 connected nodes in the trivial example supplied" do
      example_graph = [[1, 2], [2, 1]]
      paths = directed_graph.connected_nodes(example_graph)
      paths.should =~ [[1, 2]]
    end
    
    it "finds 3 connected nodes in a known graph" do
      example_graph = [[1, 2], [2, 3], [3, 4], [3, 5], [3, 6], [6, 2]]
      paths = directed_graph.connected_nodes(example_graph)
      paths.should =~ [[1], [2, 3, 6], [4], [5]]
    end
    
    it "finds 4 connected nodes in a known graph" do
      example_graph = [[1, 2], [2, 3], [3, 1], [2, 4], [4, 1]]
      paths = directed_graph.connected_nodes(example_graph)
      paths.should =~ [[1, 2, 3, 4]]
    end

    it "finds no connected nodes" do
      example_graph = [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7]]
      paths = directed_graph.connected_nodes(example_graph)
      paths.should =~ [[1], [2], [3], [4], [5], [6], [7]]
    end
  end
  
  describe "determine if connected nodes form loops, if number of connected nodes >= 1" do

    let(:directed_graph) {  DirectedGraph.new }

    it "finds a loop trivial example supplied" do
      example_graph = [[1, 2], [2, 1]]
      directed_graph.should have_loops(example_graph)
    end
    
    it "finds a loop for a known graph with a loop" do
      example_graph = [[1, 2], [2, 3], [3, 1], [2, 4], [4, 1]]
      directed_graph.should have_loops(example_graph)
    end

    it "doesn't find a loop for a known graph with no loop" do
      example_graph = [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7]]
      directed_graph.should_not have_loops(example_graph)
    end
    
  end
end