package TCP;

import java.io.IOException;
import java.net.*;

/**
 * TCPServer manage of running a TCP server.   
 */
public class TCPServer {

	/**
	 * Start the TCPServer in a unlimited loop.
	 * @param args
	 */
	public static void main(String[] args) {
		ServerSocket listenSocket = null;
		try {
			int serverPort = 7896;	// Assigns the number of the port (server)
			listenSocket = new ServerSocket(serverPort); // initialise the socket
			while(true) {
				Socket clientSocket = listenSocket.accept(); // accepts a connection from the client
				if(clientSocket.isConnected()) {	// listen socket checks if it is connected 
					System.out.println("New login"); // Console Message to verify
					Connection connection = new Connection(clientSocket); // Initialize the connection between client and server
					connection.start();	// Start the logic of the server
				}
			}
		} catch (IOException e) {
			System.out.println("Listen socket:" + e.getMessage());
		}finally {
			try {
				listenSocket.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
