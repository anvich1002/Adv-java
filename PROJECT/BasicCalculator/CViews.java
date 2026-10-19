package BasicCalculator;


import javax.swing.*;


public class CViews extends JFrame {

    JLabel lbl1, lbl2, lbl3;

    JTextField txtNum1, txtNum2, txtResult;

    JButton btnAdd, btnSub, btnMul, btnDiv;

    public CViews() {

        setTitle("Calculator");
        setSize(400, 300);
        setLayout(null);

        lbl1 = new JLabel("Enter First Number");
        lbl1.setBounds(20, 20, 150, 25);
        add(lbl1);

        txtNum1 = new JTextField();
        txtNum1.setBounds(180, 20, 150, 25);
        add(txtNum1);

        lbl2 = new JLabel("Enter Second Number");
        lbl2.setBounds(20, 60, 150, 25);
        add(lbl2);

        txtNum2 = new JTextField();
        txtNum2.setBounds(180, 60, 150, 25);
        add(txtNum2);

        btnAdd = new JButton("+");
        btnAdd.setBounds(20, 110, 60, 30);
        add(btnAdd);

        btnSub = new JButton("-");
        btnSub.setBounds(90, 110, 60, 30);
        add(btnSub);

        btnMul = new JButton("*");
        btnMul.setBounds(160, 110, 60, 30);
        add(btnMul);

        btnDiv = new JButton("/");
        btnDiv.setBounds(230, 110, 60, 30);
        add(btnDiv);

        lbl3 = new JLabel("Result");
        lbl3.setBounds(20, 170, 100, 25);
        add(lbl3);

        txtResult = new JTextField();
        txtResult.setBounds(180, 170, 150, 25);
        txtResult.setEditable(false);
        add(txtResult);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }
}