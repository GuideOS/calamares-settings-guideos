import QtQuick 2.0
import Calamares 1.0

Page {
    id: page

    property bool installNvidia: false

    title: qsTr("NVIDIA Treiber")
    description: qsTr("Installiere den proprietären NVIDIA-Grafiktreiber.")

    Column {
        spacing: 20

        CheckBox {
            id: nvidiaCheck
            text: qsTr("Proprietären NVIDIA-Treiber installieren")
            checked: page.installNvidia
            onCheckedChanged: page.installNvidia = checked
        }
    }

    onActivate: {
        // Setze Standardwert, falls gewünscht
        page.installNvidia = false
    }

    // Speichere die Auswahl für das Python-Modul
    function save() {
        return { "installNvidia": page.installNvidia }
    }
}