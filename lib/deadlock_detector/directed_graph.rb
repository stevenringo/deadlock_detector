module DeadlockDetector
  class DirectedGraph
    def connected_nodes(graph)
      @graph = graph
      @index, @stack, @indice, @lowlink, @scc = 0, [], {}, {}, []
      @graph.flatten(1).uniq.each{ |v| find_connections(v) unless @indice[v] }
      @scc
    end
    
    def has_loops?(graph)
      connected_nodes(graph).select{ |a| a.length > 1 }.length >= 1
    end

    private
    
    def find_connections(v)
      @indice[v] = @index
      @lowlink[v] = @index
      @index += 1
      @stack.push(v)
      @graph.each do |vv, w|
        next unless vv == v
        if !@indice[w]
          find_connections(w)
          @lowlink[v] = [@lowlink[v], @lowlink[w]].min
        elsif @stack.include?(w)
          @lowlink[v] = [@lowlink[v], @indice[w]].min
        end
      end
      if @lowlink[v] == @indice[v]
        i = @stack.index(v)
        @scc.push(@stack[i..-1])
        @stack = @stack[0...i]
      end
    end
  end
end