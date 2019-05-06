package UDP;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

class UDPClient {
   public static void main(String args[]) throws Exception {
	   long latency = 0;
	   String totalLatency;
	   int packetsToSend = 40000;
	   
       FileOutputStream fos = null;
	   fos = new FileOutputStream("./UDPLatency.csv");
	   
	   for (int i = 0; i < packetsToSend; i++) {
	       DatagramSocket clientSocket = new DatagramSocket(); //Initialize send socket
	       InetAddress IPAddress = InetAddress.getByName("localhost"); //IP address
	       byte[] sendData = new byte[1024]; //Size of send buffer
	       byte[] receiveData = new byte[1024]; //Size of receive buffer
	       String sentence = "Hello World"; //Sentence to send
	       sendData = sentence.getBytes(); //Store text into the send buffer
    	   DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, IPAddress, 9876); //Datagram Packet with the message, length, IP address and port
	       clientSocket.send(sendPacket); //Send the message
	       long sentMillis = System.nanoTime(); //Save sent time
	       DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length); //Datagram Packet with receive data and length
	       clientSocket.receive(receivePacket); //Receive message
	       long receivedMillis = System.nanoTime(); //Save received time
	       latency = receivedMillis - sentMillis; //Calculate latency with sent and received time
	       totalLatency = Integer.toString((int) latency) + "\n"; //Transform latency to String
	       String confirmationSentence = new String(receivePacket.getData()); //Cast to String received data
	       System.out.println("Server: " + confirmationSentence); //Show confirmation
	       clientSocket.close(); //Close client socket    
	       
	       try {
	    	   fos.write(totalLatency.getBytes()); //Write on file
	       } catch (FileNotFoundException e) {
	    	   e.printStackTrace();
	       } catch (IOException e) {
	    	   e.printStackTrace();
	       }
	   }
	   try {
		   fos.close();
	   } catch (IOException e) {
	   }
   }
}