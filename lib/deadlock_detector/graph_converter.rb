module DeadlockDetector
  class GraphConverter
    def self.convert(array)
      # convert to a format for analysis using directed graphs
      # directed graph contains list of vertices connecting nodes
      # vertex is described by a pair [from_node, to_node]
      # To convert format supplied requires grouping into pairs based on processId
      # and then ordering the node by wait, then hold
      # 
      # Example:
      # input format: e.g. [[1, 1, 'H'], [1, 2, 'W'], [2, 1, 'W'], [2, 2, 'H']]
      # becomes: [[1, 2], [2, 1]]
      array.sort_by { |k| [k[0], k[2], k[1]] }.group_by { |k| k[0] }.values.map { |k| [k[0][1], k[1][1]] }
    end
  end
end