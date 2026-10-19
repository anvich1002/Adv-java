import java.io.*;
import java.net.*;
public class client {
    public static void main(String[] args) {
        
        try{
            Socket socket = new Socket("localhost", 5000);
            System.out.println("Client connected!");  
        
            BufferedReader input = new BufferedReader(
                new InputStreamReader(socket.getInputStream()));
            PrintWriter output = new PrintWriter(socket.getOutputStream(), true); 
            output.println("Hello server");
            String message = input.readLine();
            System.out.println("Server says: " + message);  
            socket.close();
            System.out.println("Connenction closed.");
        }catch(IOException e){
            System.out.println("Error: " + e);
        }
    }
}