package data.structure;

/**
 *	Router manage the distance-vector table of each router.
 */
public class Router {
	
	private int[][] table;
	private int routerId;
	private Graph network;
	
	public Router(Graph graph, int routerId) {
		network = graph;
		this.routerId = routerId;
		table = new int[graph.getNumberOfNodes()][graph.getNumberOfNodes()];
	}
	
	/**
	 * Set neighbour routers in this distance-vector router.
	 */
	public void setNeighbours() {
		for(int i = 0; i < network.getNumberOfNodes(); i++) {
			if(network.isNode(routerId, i)) {
				table[routerId][i] = network.getNode(routerId, i);
			}
		}
	}
	
	@Override
	public String toString() {
		StringBuilder s = new StringBuilder();
        for (int i = 0; i < table.length; i++){
            s.append(i + ": ");
            for(int j: table[i]){
                s.append(j + " ");
            }
            s.append("\n");
        }
        return s.toString();
	}
}
