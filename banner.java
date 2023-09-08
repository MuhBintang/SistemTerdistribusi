import javax.swing.*;
import java.awt.*;

class Banner extends JFrame {
    private JLabel label;
    private String bannerText = "";

    Banner(String title) {
        super(title);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JPanel inputPanel = new JPanel();
        JTextField nameField = new JTextField(20);
        JButton submitButton = new JButton("Submit");

        submitButton.addActionListener(e -> {
            String name = nameField.getText();
            if (!name.isEmpty()) {
                bannerText = name;
                moveBanner();
            }
        });

        label = new JLabel();
        inputPanel.add(nameField);
        inputPanel.add(submitButton);

        getContentPane().add(inputPanel, BorderLayout.NORTH);
        getContentPane().add(label, BorderLayout.CENTER);

        setSize(400, 100);
        setVisible(true);
    }

    void moveBanner() {
        Thread thread = new Thread(() -> {
            int x = getWidth();
            while (x > -bannerText.length() * 8) {
                x -= 5;
                label.setText(padSpaces(x) + bannerText);
                try {
                    Thread.sleep(100); // Ubah angka ini untuk mengatur kecepatan perpindahan
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            bannerText = "";
            label.setText("");
        });
        thread.start();
    }

    private String padSpaces(int count) {
        StringBuilder spaces = new StringBuilder();
        for (int i = 0; i < count; i++) {
            spaces.append(" ");
        }
        return spaces.toString();
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new Banner("Banner Bergerak");
        });
    }
}
