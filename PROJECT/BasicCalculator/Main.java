
package BasicCalculator;

public class Main {
    public static void main(String[] args) {
        CViews view = new CViews();
        CModels model = new CModels();
        new CController(view, model);
    }
}