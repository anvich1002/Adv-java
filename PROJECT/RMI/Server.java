package RMI;
import java.rmi.Naming;//making url

public class Server {
    public static void main(String[] args) {
        try {
            CalculatorImpl obj = new CalculatorImpl();
            Naming.rebind("rmi://localhost/Calculator", obj);//rebind method is used to bind the specified name to a remote object. If the name is already bound, it is first unbound.
            System.out.println("RMI is started...");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
