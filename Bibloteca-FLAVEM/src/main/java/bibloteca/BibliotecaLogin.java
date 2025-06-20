package bibloteca;

import javafx.application.Application;
import javafx.geometry.*;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.*;
import javafx.stage.Stage;


public class BibliotecaLogin extends Application {

    @Override
    public void start(Stage primaryStage) {
        // Logo
        ImageView logo = new ImageView(new Image(getClass().getResource("/Icons/logo100.png").toExternalForm()));
        logo.setFitWidth(300);
        logo.setPreserveRatio(true);

        VBox logoContainer = new VBox(logo);
        logoContainer.setAlignment(Pos.CENTER);
        logoContainer.setPadding(new Insets(15));

        // Formulario
        Label titulo = new Label("BIBLIOTECA");
        titulo.setStyle("-fx-font-size: 20px; -fx-font-weight: bold;");

        Label usuarioLabel = new Label("Usuario:");
        TextField usuarioField = new TextField();
        usuarioField.setPrefWidth(300);

        Hyperlink olvidoUsuario = new Hyperlink("¿Olvidaste tu usuario?");
        olvidoUsuario.setOnAction(e -> {
            Alert alerta = new Alert(Alert.AlertType.INFORMATION);
            alerta.setTitle("Recuperación de usuario");
            alerta.setHeaderText(null);
            alerta.setContentText("Contacta al administrador para recuperar tu usuario.");
            alerta.showAndWait();
        });

        Label contrasenaLabel = new Label("Contraseña:");
        PasswordField contrasenaField = new PasswordField();
        contrasenaField.setPrefWidth(300);

        Hyperlink olvidoContrasena = new Hyperlink("¿Olvidaste tu contraseña?");
        olvidoContrasena.setOnAction(e -> {
            Alert alerta = new Alert(Alert.AlertType.INFORMATION);
            alerta.setTitle("Recuperación de contraseña");
            alerta.setHeaderText(null);
            alerta.setContentText("Se te enviará un correo con instrucciones.");
            alerta.showAndWait();
        });

        Button loginBtn = new Button("Iniciar sesión");
        loginBtn.setMaxWidth(Double.MAX_VALUE);
        loginBtn.setStyle("-fx-background-color: #222; -fx-text-fill: white; -fx-font-weight: bold;");

        loginBtn.setOnAction(e -> {
            String usuario = usuarioField.getText();
            String contrasena = contrasenaField.getText();

            if (autenticar(usuario, contrasena)) {
                primaryStage.close(); // cerrar JavaFX
                javax.swing.SwingUtilities.invokeLater(DashboardUI::new); // abrir Swing
            } else {
                Alert alerta = new Alert(Alert.AlertType.ERROR);
                alerta.setTitle("Error de autenticación");
                alerta.setHeaderText(null);
                alerta.setContentText("Usuario o contraseña incorrectos.");
                alerta.showAndWait();
            }
        });

        VBox form = new VBox(10, titulo,
                usuarioLabel, usuarioField, olvidoUsuario,
                contrasenaLabel, contrasenaField, olvidoContrasena,
                loginBtn);
        form.setAlignment(Pos.CENTER_LEFT);
        form.setPadding(new Insets(20));
        form.setMaxWidth(400);
        HBox.setHgrow(form, Priority.ALWAYS);

        // Panel principal
        HBox contenido = new HBox(50, logoContainer, form);
        contenido.setAlignment(Pos.CENTER);
        contenido.setPadding(new Insets(50));
        contenido.setStyle("-fx-background-color: white; -fx-border-radius: 20px; -fx-background-radius: 20px;");

        // Fondo
        StackPane root = new StackPane(contenido);
        root.setStyle("-fx-background-color: #333333;");
        root.setPadding(new Insets(300));

        Scene scene = new Scene(root, 800, 600);
        primaryStage.setTitle("Login Biblioteca");
        primaryStage.setScene(scene);
        primaryStage.setMaximized(true);
        primaryStage.show();
    }

    // Método de autenticación simple
    private boolean autenticar(String usuario, String contrasena) {
        return usuario.equals("admin") && contrasena.equals("1234");
    }

    public static void main(String[] args) {
        launch(args);
    }
}
