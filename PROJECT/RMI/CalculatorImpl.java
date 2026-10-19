package RMI;

import java.rmi.server.UnicastRemoteObject;
import java.rmi.RemoteException;

public class CalculatorImpl 
    extends UnicastRemoteObject implements Calculator {
        CalculatorImpl() throws RemoteException {//CalculatorImpl constructor throws RemoteException
            super();// called to the constructor of UnicastRemoteObject ...called parent class constructor
        }
        public int add(int a, int b) {
            return a + b;
        }
        public int subtract(int a, int b) {
            return a - b;
        }
    }

