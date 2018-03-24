import QtQuick 2.7

MouseArea {
    id: nav
    width: childrenRect.width
    height: childrenRect.height
    property bool active: false
    property string text: "Nav"

    Text {
        text: parent.text
        opacity: parent.active ? 1 : 0.7
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    onClicked: {
        this.active = true

        var siblings = parent.children

        for (var i = 0; i < siblings.length; i++)
            if (siblings[i] !== this)
                siblings[i].active = false
    }
}
