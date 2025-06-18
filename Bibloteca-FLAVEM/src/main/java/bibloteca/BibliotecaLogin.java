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

        Label contrasenaLabel = new Label("Contraseña:");
        PasswordField contrasenaField = new PasswordField();
        contrasenaField.setPrefWidth(300);

        Hyperlink olvidoContrasena = new Hyperlink("¿Olvidaste tu contraseña?");

        Button loginBtn = new Button("Iniciar sesión");
        loginBtn.setMaxWidth(Double.MAX_VALUE);
        loginBtn.setStyle("-fx-background-color: #222; -fx-text-fill: white; -fx-font-weight: bold;");

        VBox form = new VBox(10, titulo,
                usuarioLabel, usuarioField, olvidoUsuario,
                contrasenaLabel, contrasenaField, olvidoContrasena,
                loginBtn);
        form.setAlignment(Pos.CENTER_LEFT);
        form.setPadding(new Insets(20));
        form.setMaxWidth(400);
        HBox.setHgrow(form, Priority.ALWAYS);

        // Contenedor principal (panel blanco con esquinas redondeadas)
        HBox contenido = new HBox(50, logoContainer, form);
        contenido.setAlignment(Pos.CENTER);
        contenido.setPadding(new Insets(100));
        contenido.setStyle("-fx-background-color: white; -fx-border-radius: 20px; -fx-background-radius: 20px;");

        // Fondo general negro con padding alrededor del contenido
        StackPane root = new StackPane(contenido);
        root.setStyle("-fx-background-color: #333333;");
        root.setPadding(new Insets(300)); // Espacio para separar del borde de la ventana

        Scene scene = new Scene(root, 800, 600);
        primaryStage.setTitle("Login Biblioteca");
        primaryStage.setScene(scene);
        primaryStage.setMaximized(true);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
