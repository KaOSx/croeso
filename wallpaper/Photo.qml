import QtQuick 2.7
import QtQuick.Controls 2.0
//import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts
import Unwallpaper 1.0

MouseArea {
    property PhotoModel model: PhotoModel {}
    // Whether to remove view if download was removed
    property bool removeView: false

    id: photo
    width: parent.width
    height: parent.width * 0.5625 + 40

    Image {
        id: image
        width: parent.width
        height: parent.height - 40
        fillMode: Image.PreserveAspectCrop
        source: model.regularUrl
        cache: true

        Rectangle {
            id: progressBar
            height: parent.height
            width: 0
            color: "#5544CC88"

            Behavior on width {
                SmoothedAnimation { easing.type: Easing.Linear }
            }

            Timer {
                id: progressBarResetTimer
                interval: 300
                onTriggered: {
                    progressBar.visible = false
                    progressBar.width = 0
                }
            }
        }
    }

    Item {
        id: footer
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height: 30

        Text {
            text: "© " + model.userFullName + " / Unsplash / CC0"
            verticalAlignment: Text.AlignVCenter
        }

        Button {
            id: downloadButton
            //: Photo action button
            text: model.local ? "✓ " + qsTr("Downloaded") : qsTr("Download")
            visible: !model.local
            anchors.right: parent.right

            onClicked: {
                model.download();
                downloadButton.enabled = false
            }
        }

        Button {
            id: removeButton
            visible: model.local
            anchors.right: parent.right
            text: qsTr("Remove")

            onClicked: {
                model.remove();
                downloadButton.enabled = true
                if (removeView) {
                    photo.destroy();
                }
            }
        }

        Button {
            id: setWallpaperButton
            //: Photo action button
            text: qsTr("Set wallpaper")
            visible: model.local

            anchors.right: removeButton.left
            anchors.rightMargin: 10

            onClicked: {
                model.setWallpaper();
            }
        }
    }

    Connections {
        target: model

        onDownloadProgress: {
            progressBar.visible = true
            progressBar.width = image.width * bytesRead / totalBytes / 2
        }

        onSaveProgress: {
            progressBar.width = image.width * (filesSaved / totalFiles / 2 + 0.5)
        }

        onSaved: {
            progressBar.width = image.width
            progressBarResetTimer.start()
        }
    }
}
