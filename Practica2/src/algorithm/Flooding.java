package algorithm;

import java.security.SecureRandom;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Random;

import graph.Graph;

public class Flooding {
	
	private Queue<Integer> toVisit; // Cola de routers a visitar
	private Queue<Integer> notToVisit; // Cola de routers para no visitar
	private Graph network;
	private int[] packetsTransmited;  // Paquetes transmitidos por cada router
	private int[] packetsReceived;	 // Paquetes recibidos por cada router
	private StringBuilder outputIterations;
	
	public Flooding(Graph network) {
		toVisit = new LinkedList<>();
		notToVisit = new LinkedList<>();
		this.network = network;
		outputIterations = new StringBuilder();
		packetsTransmited = new int[network.getNumberOfNodes()];
		packetsReceived = new int[network.getNumberOfNodes()];
	}
	
	/**
	 * Autogenera un número aleatorio que indica desde que router comenzará la transmisión de paquetes.
	 * Tiene un número máximo de iteraciones que es igual al número de routers de la red. A mayor número de 
	 * iteraciones, mayor probabilidad de que alcance todos los routers de la red pero  
	 */
	public void start() {
		int firstRouter = generateRandomNumber();
		toVisit.add(firstRouter);
		notToVisit.add(-1);	// Añade a la cola de no visitar -1 que indica que debe visitar todos los vecinos.
		for(int i = 0; i < network.getNumberOfNodes() + 10; i++) {
			int routerToVisit = toVisit.remove();
			int routerNotToVisit = notToVisit.remove();
			visitRouter(routerToVisit, routerNotToVisit);
		}
	}
	
	/**
	 * Genera un string con el envío de paquetes así como los vecinos que se ignoran.
	 * Además muestra un resumen con los paquetes recibidos y enviados por cada router.
	 */
	@Override
	public String toString() {
		generateSummary();
		return outputIterations.toString();
	}

	/**
	 * Encuentra los nodos vecinos de un router y los añade a la cola para las siguientes visitas.
	 * A su vez añade a la cola de no visitar el nodo actual, de tal forma que el paquete no se reenvie.
	 * Cuenta con dos contadores para saber cuantos paquetes ha transmitido y recibido el router.
	 * 
	 * @param router - desde el router de donde se parte.
	 * @param routerNot - ignora este router porque es de donde recibe el paquete.
	 */
	private void visitRouter(int router, int routerNotToVisit) {
		outputIterations.append("Router " + router + ": ");
		for(int visitingRouter = 0; visitingRouter < network.getNumberOfNodes(); visitingRouter++) {
			if(routerNotToVisit != visitingRouter && network.isNode(router, visitingRouter)) {
				toVisit.add(visitingRouter);
				packetsTransmited[router]++;
				packetsReceived[visitingRouter]++;
				outputIterations.append(visitingRouter + " | ");
				notToVisit.add(router);
			}
		}
		outputIterations.append(" ignore router: " + (routerNotToVisit == -1 ? "None" : routerNotToVisit) + "\n");
	}
	
	/**
	 * @return a random integer from 0 to number of routers in the network.
	 */
	private int generateRandomNumber() {
		Random generate = new SecureRandom(); 
		int max = network.getNumberOfNodes();
		return generate.nextInt(max);
	}
	
	/**
	 * Crea un resumen de la actividad de cada router de la red.
	 */
	private void generateSummary() {
		for(int i = 0; i < network.getNumberOfNodes(); i++) {
			outputIterations.append("\nRouter " + i + ": ");
			outputIterations.append("\nTransmited packets: " + packetsTransmited[i]);
			outputIterations.append("\nReceived packets: " + packetsReceived[i] + "\n\n");
		}
	}
}
