package algorithm;

import data.structure.Graph;
import data.structure.Router;

/**
 *  DistanceVector manages to create all the routers of the network and have methods
 *  to the execution of a Bellman Ford algorithm.
 */
public class DistanceVector {
	
	private Graph network;
	private Router[] routers;
	
	public DistanceVector(Graph graph) {
		network = graph;
		routers = new Router[graph.getNumberOfNodes()];
		initialiseRouters();
	}
	
	/**
	 * Set all routers neighbours in their respective tables.
	 */
	public void setNeighbourRoutersTable() {
		for(int i = 0; i < routers.length; i++) {
			routers[i].setNeighbours();
		}
	}
	
	@Override
	public String toString() {
		StringBuilder output = new StringBuilder();
		for(int i = 0; i < routers.length; i++) {
			output.append(routers[i] + "\n\n");
		}
		return output.toString();
	}
	
	private void initialiseRouters() {
		for(int i = 0; i < routers.length; i++) {
			routers[i] = new Router(network, i);
		}
	}
}
