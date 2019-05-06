package TCP;

import java.io.IOException;
import java.net.*;

public class TCPServer {

	public static void main(String[] args) {
		ServerSocket listenSocket = null;
		try {
			int serverPort = 7896;
			listenSocket = new ServerSocket(serverPort);
			while(true) {
				Socket clientSocket = listenSocket.accept();
				if(clientSocket.isConnected()) {
					System.out.println("New login");
					Connection connection = new Connection(clientSocket);
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
