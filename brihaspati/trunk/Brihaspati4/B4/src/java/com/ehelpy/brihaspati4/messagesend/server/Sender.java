package com.ehelpy.brihaspati4.messagesend.server;

   
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

public class Sender {
public static  Scanner scanner;
/**
* this function actually transfers file
* @param portNo
* @param fileLocation
* @throws IOException 
*/
public static  void send(int portNo,String fileLocation) throws IOException
{

FileInputStream fileInputStream = null;
BufferedInputStream bufferedInputStream = null;

OutputStream outputStream = null;
ServerSocket serverSocket = null;
Socket socket = null;

//creating connection between sender and receiver
try {
serverSocket = new ServerSocket(portNo);
System.out.println("Waiting for receiver...");
try {
socket = serverSocket.accept();
System.out.println("Accepted connection : " + socket);
//connection established successfully
//creating object to send file
File file = new File (fileLocation);
byte [] byteArray  = new byte [(int)file.length()];
fileInputStream = new FileInputStream(file);
bufferedInputStream = new BufferedInputStream(fileInputStream);
bufferedInputStream.read(byteArray,0,byteArray.length); // copied file into byteArray
//sending file through socket
outputStream = socket.getOutputStream();
System.out.println("Sending " + fileLocation + "( size: " + byteArray.length + " bytes)");
outputStream.write(byteArray,0,byteArray.length);    //copying byteArray to socket
outputStream.flush();    //flushing socket
System.out.println("Done.");    //file has been sent
}
finally {
if (bufferedInputStream != null) bufferedInputStream.close();
if (outputStream != null) bufferedInputStream.close();
if (socket!=null) socket.close();
}    
} catch (IOException e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
finally {
if (serverSocket != null) serverSocket.close();
}
}

}