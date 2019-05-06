package TCP;

import java.io.*;
import java.net.Socket;
import java.net.UnknownHostException;

public class TCPClient {
	
	private static long[] latency;
	private final static int NUMBER = 400;
	
	public static void main(String[] args) {
		latency = new long[NUMBER];
		Socket s = null;
		try {
			for(int i = 0; i < NUMBER; i++) {
				int serverPort = 7896;
				s = new Socket("localhost", serverPort);
				DataOutputStream out = new DataOutputStream(s.getOutputStream());
				BufferedReader in = new BufferedReader(new InputStreamReader(s.getInputStream()));
				out.writeUTF("hola");
				long timeSentInNanoseconds = System.nanoTime();
				System.out.println(in.readLine());
				long timeReceiveInNanoseconds = System.nanoTime();
				latency[i] = timeReceiveInNanoseconds - timeSentInNanoseconds;
			}
			writeFile();
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
