package TCP;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

/**
 * Establish a connection between the client and server.
 * Inheriting of class Thread allow Connection to make multiple connections to the server.
 */
public class Connection extends Thread{

	private DataInputStream in;
	private DataOutputStream out;
	private Socket clientSocket;
	
	/**
	 * Initialise a connection by taking a socket as an argument. Also get the necessary instances to
	 * take the appropriate input / output to talk between client
	 * @param clientSocket
	 */
	public Connection(Socket clientSocket) {
		try {
			this.clientSocket = clientSocket;
			in = new DataInputStream(clientSocket.getInputStream());
			out = new DataOutputStream(clientSocket.getOutputStream());
		} catch (IOException e) {
			System.out.println("Connection: " + e.getMessage()); // Error Message
		}
	}
	
	/**
	 * Run() start the action of this thread in this case by taking the message of the client an sending 
	 * back in uppercase.
	 */
	public void run() {
		try {
			String data = in.readUTF();
			System.out.println("RECEIVED FROM CLIENT: " + data);
			out.writeUTF(data.toUpperCase()); // Return to client the message in Uppercase
		} catch (IOException e) {
			System.out.println("readline: " + e.getMessage());
		}finally {
			try {
				clientSocket.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
