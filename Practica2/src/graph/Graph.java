package graph;

public class Graph {

    private int[][] adjMatrix;
    private final int numVertices;

    public Graph(int numVertices) {
        this.numVertices = numVertices;
        adjMatrix = new int[numVertices][numVertices];
    }

    public void addNode(int i, int j, int value) {
        adjMatrix[i][j] = value;
    }

    public void removeNode(int i, int j) {
        adjMatrix[i][j] = 0;
    }

    public boolean isNode(int i, int j) {
        return adjMatrix[i][j] != 0;
    }
    
    public int getNumberOfNodes() {
    	return numVertices;
    }
    
    public int getNode(int i, int j) {
    	return adjMatrix[i][j];
    }

    public String toString() {
        StringBuilder s = new StringBuilder();
        for (int i = 0; i < this.numVertices; i++){
            s.append(i + ": ");
            for(int j: adjMatrix[i]){
                s.append(j + " ");
            }
            s.append("\n");
        }
        return s.toString();
    }
}

