package RMI;
import java.rmi.Remote;
import java.rmi.RemoteException;//exception handling for remote method invocation

public interface Calculator  extends Remote{
    int add(int a, int b) throws RemoteException;
    int subtract(int a, int b) throws RemoteException;
}
