module yahir.com.designing_dashboard {
    requires javafx.controls;
    requires javafx.fxml;

    requires org.controlsfx.controls;
    requires com.dlsc.formsfx;
    requires org.kordamp.bootstrapfx.core;
    requires java.desktop;
    requires com.formdev.flatlaf;

    opens yahir.com.designing_dashboard to javafx.fxml;
    exports yahir.com.designing_dashboard;
}