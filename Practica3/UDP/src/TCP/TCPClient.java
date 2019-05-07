package TCP;

import java.io.*;
import java.net.Socket;
import java.net.UnknownHostException;

/**
 * TCPClient manage to connect to a TCP server.
 */
public class TCPClient {
	
	private static long[] latency;	// attribute that store the latency 
	private final static int NUMBER = 400;	// attribute that store the maximum of messages to send
	
	public static void main(String[] args) {
		latency = new long[NUMBER];
		Socket s = null;
		try {
			for(int i = 0; i < NUMBER; i++) {
				int serverPort = 7896;	// Port of the server
				s = new Socket("localhost", serverPort);  // Establish connection with this host and connects to the server port.
				DataOutputStream out = new DataOutputStream(s.getOutputStream());
				BufferedReader in = new BufferedReader(new InputStreamReader(s.getInputStream()));
				out.writeUTF("hola"); // Send a message to the server
				long timeSentInNanoseconds = System.nanoTime();
				System.out.println(in.readLine()); // Receive a message from the server
				long timeReceiveInNanoseconds = System.nanoTime();
				latency[i] = timeReceiveInNanoseconds - timeSentInNanoseconds; // Calculate the latency of each message.
			}
			writeFile(); // Calls a method that write in a file the latencies.
		}
		catch (UnknownHostException e) {
			System.out.println("Socket: " + e.getMessage());
		}catch (EOFException e) {
			System.out.println("EOF: " + e.getMessage());
		}catch (IOException e) {
			System.out.println("Readline: " + e.getMessage());
		}finally {
			if(s != null) {
				try {
					s.close();
				} catch (IOException e) {
					System.out.println("Close: " + e.getMessage());
				}
			}
		}
	}
	
	/**
	 * writeFile manages to create a file and set the latencies in csv format.
	 */
	public static void writeFile() {
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream("./TCPLatency.csv");
			String file = "";
			for(int i = 0; i < NUMBER; i++) {
				file = Integer.toString((int) latency[i]) + "\n";
				try {
					fos.write(file.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println("No se ha podido abrir el archivo.");
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally {
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
