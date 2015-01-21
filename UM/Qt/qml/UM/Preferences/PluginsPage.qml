import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import UM 1.0 as UM
PreferencesPage {
    title: "Plugins"
     contents: ScrollView {
        anchors.fill: parent;
        ListView {
            delegate: settingDelegate
            model: UM.Models.pluginsModel

            section.property: "category"
            section.delegate: Label { text: section }
        }
    }

    Component
    {
        id: settingDelegate
        CheckBox
        {
            text: model.name;
            x: depth * 25
            checked: model.visibility
            onClicked: ListView.view.model.setVisibility(model.key, checked)
            enabled: !model.disabled
        }
    }
}
