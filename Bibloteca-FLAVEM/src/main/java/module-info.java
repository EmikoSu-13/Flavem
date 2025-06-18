module bibloteca.bibloteca {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.controlsfx.controls;
    requires org.kordamp.bootstrapfx.core;

    opens bibloteca.bibloteca to javafx.fxml;
    exports bibloteca;

}