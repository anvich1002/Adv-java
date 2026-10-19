package RMI;
import java.rmi.Naming;
public class Client{
    public static void main(String[] args) {
        try{
            Calculator obj=(Calculator) Naming.lookup(
                "rmi://localhost/Calculator");
                System.out.println("addition="+ obj.add(5,4));
                System.out.println("subtraction="+ obj.subtract(20,4));
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}