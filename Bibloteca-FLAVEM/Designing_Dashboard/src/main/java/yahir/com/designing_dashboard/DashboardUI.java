package yahir.com.designing_dashboard;
import com.formdev.flatlaf.FlatLightLaf;

import javax.swing.*;
import javax.swing.border.*;
import java.awt.*;

public class DashboardUI extends JFrame {

    public DashboardUI() {
        try {
            UIManager.setLookAndFeel(new FlatLightLaf());
        } catch (Exception e) {
            e.printStackTrace();
        }

        setTitle("FLAVEM | Panel de Estadísticas");
        setSize(1200, 700);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        // Panel lateral izquierdo (sidebar)
        JPanel sidebar = new JPanel();
        sidebar.setBackground(new Color(174, 145, 102));
        sidebar.setPreferredSize(new Dimension(220, getHeight()));
        sidebar.setLayout(new BoxLayout(sidebar, BoxLayout.Y_AXIS));
        sidebar.setBorder(new EmptyBorder(20, 10, 20, 10));
        add(sidebar, BorderLayout.WEST);

        JLabel logo = new JLabel("FLAVEM", SwingConstants.CENTER);
        logo.setFont(new Font("Serif", Font.BOLD, 28));
        logo.setForeground(Color.WHITE);
        logo.setAlignmentX(Component.CENTER_ALIGNMENT);
        sidebar.add(logo);

        sidebar.add(Box.createRigidArea(new Dimension(0, 10)));

        JLabel userLabel = new JLabel("<html><div style='text-align:center;'>\uD83D\uDC64<br><b>Super administrador</b><br>José Ángel Álvarez Flores</div></html>");
        userLabel.setForeground(Color.WHITE);
        userLabel.setFont(new Font("SansSerif", Font.PLAIN, 12));
        userLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
        sidebar.add(userLabel);

        sidebar.add(Box.createRigidArea(new Dimension(0, 20)));

        String[] items = {"Administradores", "Dashboard", "Usuarios", "Configuración", "Cerrar sesión"};
        for (String item : items) {
            JButton btn = new JButton(item);
            btn.setFocusPainted(false);
            btn.setBackground(new Color(143, 119, 85));
            btn.setForeground(Color.WHITE);
            btn.setFont(new Font("SansSerif", Font.PLAIN, 14));
            btn.setAlignmentX(Component.CENTER_ALIGNMENT);
            btn.setMaximumSize(new Dimension(180, 35));
            btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
            sidebar.add(Box.createRigidArea(new Dimension(0, 6)));
            sidebar.add(btn);
        }

        // Panel principal
        JPanel mainPanel = new JPanel(new GridLayout(2, 2, 15, 15));
        mainPanel.setBackground(new Color(48, 48, 48));
        mainPanel.setBorder(new EmptyBorder(30, 30, 30, 30));

        // Tarjetas simuladas
        mainPanel.add(createCard("\uD83D\uDCD6 Gestión de Libros", new String[]{
                "12,340 Libros registrados", "9,785 Libros disponibles", "2,555 Libros prestados"
        }));

        mainPanel.add(createCard("\uD83D\uDC64 Panel de Usuarios", new String[]{
                "4,560 Usuarios registrados", "1,234 Usuarios activos", "120 Nuevos este mes"
        }));

        mainPanel.add(createCard("\uD83D\uDCDA Seguimiento de Préstamos", new String[]{
                "1,540 Activos", "102 Vencidos", "678 Este mes"
        }));

        mainPanel.add(createCard("\uD83D\uDCCA Actividad reciente", new String[]{
                "Top 5 libros prestados", "Usuarios con más préstamos", "Gráficas próximamente"
        }));

        add(mainPanel, BorderLayout.CENTER);
        setVisible(true);
    }

    private JPanel createCard(String title, String[] lines) {
        JPanel panel = new JPanel();
        panel.setBackground(Color.WHITE);
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
        panel.setBorder(new CompoundBorder(
                new LineBorder(new Color(200, 200, 200), 2, true),
                new EmptyBorder(15, 15, 15, 15)));

        JLabel titleLabel = new JLabel(title);
        titleLabel.setFont(new Font("SansSerif", Font.BOLD, 16));
        titleLabel.setAlignmentX(Component.LEFT_ALIGNMENT);
        panel.add(titleLabel);

        panel.add(Box.createRigidArea(new Dimension(0, 10)));

        for (String line : lines) {
            JLabel stat = new JLabel(line);
            stat.setFont(new Font("SansSerif", Font.PLAIN, 14));
            stat.setAlignmentX(Component.LEFT_ALIGNMENT);
            panel.add(stat);
            panel.add(Box.createRigidArea(new Dimension(0, 6)));
        }

        return panel;
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(DashboardUI::new);
    }
}
