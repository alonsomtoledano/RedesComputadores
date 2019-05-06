package UDP;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

class UDPServer {
   public static void main(String args[]) throws Exception {
       String confirmation = "Received"; //String of confirmation
       DatagramSocket serverSocket = new DatagramSocket(9876); //Initialize receive socket
       while(true) {
    	   byte[] receiveData = new byte[1024]; //Size of receive buffer
           byte[] sendData = new byte[1024]; //Size of send buffer
    	   DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length); //Datagram Packet with receive data and length
           serverSocket.receive(receivePacket); //Receive message
           String sentence = new String(receivePacket.getData()); //Cast to String received data
           System.out.println("Received: " + sentence); //Show received sentence
           InetAddress IPAddress = receivePacket.getAddress(); //Recived IP address
           int port = receivePacket.getPort(); //Recived port
           sendData = confirmation.getBytes(); //Store confirmation text into the send buffer
           DatagramPacket sendPacket = new DatagramPacket(sendData, sendData.length, IPAddress, port); //Datagram Packet with the confirmation message, length, IP address and port
           serverSocket.send(sendPacket); //Send the message
       }
   }
}