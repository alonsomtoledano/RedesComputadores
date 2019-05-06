package TCP;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

public class Connection extends Thread{

	DataInputStream in;
	DataOutputStream out;
	Socket clientSocket;
	
	public Connection(Socket clientSocket) {
		try {
			this.clientSocket = clientSocket;
			in = new DataInputStream(clientSocket.getInputStream());
			out = new DataOutputStream(clientSocket.getOutputStream());
			this.start();
		} catch (IOException e) {
			System.out.println("Connection: " + e.getMessage());
		}
	}
	
	public void run() {
		try {
			String data = in.readUTF();
			System.out.println("RECEIVED FROM CLIENT: " + data);
			out.writeUTF(data);
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
