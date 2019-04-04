package dev.joseluis;

public class Main {

    public static void main(String[] args)
    {
        Graph g = new Graph(7);

        g.addEdge(0, 1, 2);
        g.addEdge(0, 2, 5);
        g.addEdge(0, 6, 1);
        g.addEdge(1,0,2);
        g.addEdge(1, 2, 3);
        g.addEdge(1,6,3);
        g.addEdge(2, 1, 3);
        g.addEdge(2, 3, 1);
        g.addEdge(2,5,1);
        g.addEdge(2,6,3);
        g.addEdge(3,2,1);
        g.addEdge(3,5,2);
        g.addEdge(5,2,1);
        g.addEdge(5,6,1);
        g.addEdge(6,0,1);
        g.addEdge(6,1,2);
        g.addEdge(6,1,2);
        g.addEdge(6,2,3);
        g.addEdge(6,5,1);
        System.out.print(g);


    }

}
