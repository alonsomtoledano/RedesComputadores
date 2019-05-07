import algorithm.Flooding;
import graph.Graph;

public class Main {

    public static void main(String[] args){
        Graph g = new Graph(7);

        g.addNode(0, 1, 2);
        g.addNode(0, 2, 5);
        g.addNode(0, 6, 1);
        g.addNode(1,0,2);
        g.addNode(1, 2, 3);
        g.addNode(1,6,3);
        g.addNode(2, 1, 3);
        g.addNode(2, 3, 1);
        g.addNode(2,5,1);
        g.addNode(2,6,3);
        g.addNode(3,2,1);
        g.addNode(3,5,2);
        g.addNode(5,2,1);
        g.addNode(5,6,1);
        g.addNode(6,0,1);
        g.addNode(6,1,2);
        g.addNode(6,1,2);
        g.addNode(6,2,3);
        g.addNode(6,5,1);
        System.out.print(g);
//    	Graph g = new Graph(6);
//    	g.addNode(0, 1, 1);
//    	g.addNode(0, 2, 1);
//    	g.addNode(1, 0, 1);
//    	g.addNode(1, 4, 1);
//    	g.addNode(2, 0, 1);
//    	g.addNode(2, 3, 1);
//    	g.addNode(2, 4, 1);
//    	g.addNode(3, 2, 1);
//    	g.addNode(3, 5, 1);
//    	g.addNode(4, 1, 1);
//    	g.addNode(4, 2, 1);
//    	g.addNode(4, 5, 1);
//    	g.addNode(5, 3, 1);
//    	g.addNode(5, 4, 1);
    	
    	System.out.println(g);
    	
    	Flooding fl = new Flooding(g);
    	fl.start();
    	System.out.println(fl);
    }
}
