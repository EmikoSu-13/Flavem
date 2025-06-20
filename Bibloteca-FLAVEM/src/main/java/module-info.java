module bibloteca.bibloteca {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.controlsfx.controls;
    requires org.kordamp.bootstrapfx.core;
    requires java.desktop;
    requires com.formdev.flatlaf;

    opens bibloteca.bibloteca to javafx.fxml;
    exports bibloteca;

}