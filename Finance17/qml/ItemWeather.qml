import QtQml
import QtQuick
import QtQuick.Controls
import QtQuick.Window 2.15

import QtQuick.Layouts 1.3

import Finance17 1.0
import org.mydb 1.0

Rectangle {
    id:recMain
    width: parent.width
    height: parent.height

// ############ START prepare API data to array ##############

    property string timestamp1: ""
    property string timestamp2: ""
    property string timestamp3: ""
    property string timestamp4: ""
    property string timestamp5: ""
    property string timestamp6: ""
    property string timestamp7: ""
    property string timestamp8: ""
    property string timestamp9: ""
    property string timestamp10: ""
    property string timestamp11: ""
    property string timestamp12: ""
    property string timestamp13: ""
    property string timestamp14: ""
    property string timestamp15: ""
    property string timestamp16: ""
    property string timestamp17: ""
    property string timestamp18: ""
    property string timestamp19: ""
    property string timestamp20: ""

    property int flagFirstData: 0

    property string textEdit2Text: ""
    property string textEdit3Text: ""
    property string textEdit4Text: ""

    property string timestampCorrent: ""

// ############ FIN prepare API data to array ##############


    SqlLiteDatabase {
        id: mydb
    }

    SwipeView {
        id: viewSwipeView
        anchors.fill: parent
        currentIndex: 0

        Item {
            id: appBridgeItem1

            Rectangle {
                anchors.top: appBridgeItem1.top
                width: parent.width
                y:0
                x:0
                height: 550
                color: Qt.darker("white", 1.1)
                radius: 10
                border.width: 1
                border.color: "#ccc"
                Layout.row: 0
                Layout.column: 1

                MouseArea {
                    anchors.fill: parent
                    onClicked:   {
                    // ###########
                    }
                    }

                Chart{
                    id: _line
                    anchors.fill: parent
                    anchors.margins: 2

                    property var dataA: [] // [65,59,90,81,56,55,40,11]
                    property var dataB: [] // [65,59,90,81,56,55,40,11]]
                    property string tmp: ""
                    property string tmp2: ""
                    property string tmp3: ""
                    property int numberCount: 0

                    onPaint: {
                            numberCount = mydb.searchCountDatatime("timeupdated");
                            for (let i = numberCount-100; i < numberCount; i++) {
                                tmp2 =  mydb.searchCorrentUSD("bpiUSDrate_float", i);
                                tmp = mydb.searchMaxUSD("bpiUSDrate_float", spinbox.value.toString());
//                            tmp2 =  mydb.searchIndexDatatime("bpiUSDrate_float", spinbox.value.toString(), i);
//                                console.log(tmp2, " ", numberCount,  " ", tmp - tmp2);

                            dataA[i] = i;
                            dataB[i] = tmp - tmp2;
//                            console.log(tmp);
//                            console.log(dataB[i]);
                            }

                            textEdit2.text = textEdit2Text + "\n" + numberCount + " " + tmp2;
                            textEdit2Text = textEdit2.text;

                            textEdit3.text = textEdit3Text + "\n" + numberCount + " " + mydb.searchCorrentUSD("bpiGBPrate_float", numberCount);
                            textEdit3Text = textEdit4.text;

                            textEdit4.text = textEdit4Text + "\n" + numberCount + " " +  mydb.searchCorrentUSD("bpiEURrate_float", numberCount);
                            textEdit4Text = textEdit4.text;

                             console.log(numberCount,  " ", tmp2, " ", tmp - tmp2);

                    line({
                             labels : [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 ],
                             datasets : [
                                 {
                                     fillColor : "rgba(220,220,220,0.5)",
                                     strokeColor : "rgba(220,220,220,1)",
                                     pointColor : "rgba(220,220,220,1)",
                                     pointStrokeColor : "#fff",
                                     data : dataA
                                 },
                                 {
                                     fillColor : "rgba(151,187,205,0.5)",
                                     strokeColor : "rgba(151,187,205,1)",
                                     pointColor : "rgba(151,187,205,1)",
                                     pointStrokeColor : "#fff",
                                     data : dataB
                                 }
                             ]
                         });
                    }
                }
            }

        Rectangle {
            y:550
            x:0
            width: parent.width

            ProgressBar {
                id: progressProgressBar
                from: spinbox.from
                to: spinbox.to
                value: spinbox.value
                width: parent.width
            }


            Button {
                id: buttonSwipe1
                anchors.top: progressProgressBar.bottom
                anchors.left: parent.left
                text: "All Data"
                onClicked: {
                    viewSwipeView.setCurrentIndex(1);
                }
            }

            Button {
                id: buttonSwipe2
                anchors.top: progressProgressBar.bottom
                anchors.left:  buttonSwipe1.right
                text: "USD"
                onClicked: {
                    viewSwipeView.setCurrentIndex(2);
                }
            }
            Button {
                id: buttonSwipe3
                anchors.top: progressProgressBar.bottom
                anchors.left:  buttonSwipe2.right
                text: "GBP"
                onClicked: {
                    viewSwipeView.setCurrentIndex(3);
                }
            }
            Button {
                id: buttonSwipe4
                anchors.top: progressProgressBar.bottom
                anchors.left:  buttonSwipe3.right
                text: "EUR"
                onClicked: {
                    viewSwipeView.setCurrentIndex(4);
                }
            }
            Button {
                id: buttonSwipe5
                anchors.top: progressProgressBar.bottom
                anchors.left:  buttonSwipe4.right
                text: "About"
                onClicked: {
                    viewSwipeView.setCurrentIndex(5);
                }
            }

            Text {
                id: textWarning
                anchors.top: buttonSwipe1.bottom
                anchors.left:  buttonSwipe1.left
                text: "Update every 10 sec "
                padding: 5
                color: "red"
            }
            Text {
                id: textLineTwooNum4
                anchors.top: buttonSwipe1.bottom
                anchors.left: textWarning.right
                padding: 5
                text: timestamp1
            }

            Text {
                id: textLineTwooNum1
                anchors.top: textWarning.bottom
                anchors.left:  textWarning.left
                padding: 5
                text: "USD: " + timestamp10
            }

            Text {
                id: textLineTwooNum2
                anchors.top: textWarning.bottom
                anchors.left:  textLineTwooNum1.right
                padding: 5
                text: "GBP: " + timestamp15
            }

            Text {
                id: textLineTwooNum3
                anchors.top: textWarning.bottom
                anchors.left:  textLineTwooNum2.right
                padding: 5
                text: "EUR: " + timestamp20
            }

            Text {
                id: textLineThreeNum1
                anchors.top: textLineTwooNum1.bottom
                anchors.left:  textLineTwooNum1.left
                padding: 5
                text: "ΔUSD:  " + timestamp10
            }

            Text {
                id: textLineThreeNum2
                anchors.top: textLineThreeNum1.bottom
                anchors.left:  textLineThreeNum1.left
                padding: 5
                text: "ΔGBP: " + timestamp15
            }

            Text {
                id: textLineThreeNum3
                anchors.top: textLineThreeNum2.bottom
                anchors.left:  textLineThreeNum2.left
                padding: 5
                text: "ΔEUR: " + timestamp20
            }



            Timer{
                id:t
                interval: 10000
                repeat: true
                running: true
                onTriggered:{
                    let numberCount = mydb.searchCountDatatime("timeupdated");
                    weather0.timestamp1 = mydb.searchMaxDatatime("timeupdated", numberCount);
                    weather0.timestamp2 = mydb.searchMaxDatatime("timeupdatedISO", numberCount);
                    weather0.timestamp3 = mydb.searchMaxDatatime("timeupdateduk", numberCount);
                    weather0.timestamp4 = mydb.searchMaxDatatime("disclaimer", numberCount);
                    weather0.timestamp5 = mydb.searchMaxDatatime("chartName", numberCount);
                    weather0.timestamp6 = mydb.searchMaxDatatime("bpiUSDcode", numberCount);
                    weather0.timestamp7 = mydb.searchMaxDatatime("bpiUSDsymbol", numberCount);
                    weather0.timestamp8 = mydb.searchMaxDatatime("bpiUSDrate", numberCount);
                    weather0.timestamp9 = mydb.searchMaxDatatime("bpiUSDdescription", numberCount);
                    weather0.timestamp10 = mydb.searchMaxDatatime("bpiUSDrate_float", numberCount);

                    weather0.timestamp11 = mydb.searchMaxDatatime("bpiGBPcode", numberCount);
                    weather0.timestamp12 = mydb.searchMaxDatatime("bpiGBPsymbol", numberCount);
                    weather0.timestamp13 = mydb.searchMaxDatatime("bpiGBPrate", numberCount);
                    weather0.timestamp14 = mydb.searchMaxDatatime("bpiGBPdescription", numberCount);
                    weather0.timestamp15 = mydb.searchMaxDatatime("bpiGBPrate_float", numberCount);

                    weather0.timestamp16 = mydb.searchMaxDatatime("bpiEURcode", numberCount);
                    weather0.timestamp17 = mydb.searchMaxDatatime("bpiEURsymbol", numberCount);
                    weather0.timestamp18 = mydb.searchMaxDatatime("bpiEURrate", numberCount);
                    weather0.timestamp19 = mydb.searchMaxDatatime("bpiEURdescription", numberCount);
                    weather0.timestamp20 = mydb.searchMaxDatatime("bpiEURrate_float", numberCount);

                    textLineTwooNum4.text = timestamp1;
                    textLineTwooNum1.text = "USD: " + timestamp8;
                    textLineTwooNum2.text = "GBP: " + timestamp15;
                    textLineTwooNum3.text = "EUR: " + timestamp20;

                    let d1 = mydb.searchMaxUSD("bpiUSDrate_float", numberCount) ;
                    let d2 = mydb.searchMaxUSD("bpiGBPrate_float", numberCount) ;
                    let d3 = mydb.searchMaxUSD("bpiEURrate_float", numberCount) ;

                    let d11 = mydb.searchMaxUSD("bpiUSDrate_float", numberCount) - timestamp10;
                    let d21 = mydb.searchMaxUSD("bpiGBPrate_float", numberCount) - timestamp15;
                    let d31 = mydb.searchMaxUSD("bpiEURrate_float", numberCount) - timestamp20;

                    textLineThreeNum1.text = "ΔUSD: " + d1 + " - " + timestamp10 + " = " + d11;
                    textLineThreeNum2.text = "ΔGBP: " + d2 + " - " + timestamp15 + " = " + d21;
                    textLineThreeNum3.text = "ΔEUR: " + d2 + " - " + timestamp20 + " = " + d31;

                    // Update the line chart
                    var x;
                    x = _line.dataA.shift();
                    _line.dataA.push(x)
                    x = _line.dataB.shift();
                    _line.dataB.push(x)
                    _line.requestPaint()
                }
            }
        }

        }


        Item {
            id: appBridgeItem0

            Rectangle {
                anchors.fill: parent

                Button {
                    id: buttonSwipe2Spin
                    anchors.top: parent.top
                    anchors.left:  parent.left
                    text: "HOME"
                    onClicked: {
                        viewSwipeView.setCurrentIndex(0);
                    }
                }

                SpinBox {
                    id: spinbox
                    anchors.top: parent.top
                    anchors.left:  buttonSwipe2Spin.right
                    from: 1
                    value: 1
                    to: 100
                    editable : true
                    stepSize: 1
                    font.pixelSize: 12

                    property int oldValue: 0

                    onValueChanged: {
                        if (value > oldValue) { //console.log("up")
                        }
                        else { //console.log("down")
                        }
                        oldValue = value
                    }
                }


                Button {
                    id: appBottonText20
                    text: "GET DATA"
                    anchors.left: spinbox.right
                    onClicked:   {
                    weather0.timestamp1 = mydb.searchMaxDatatime("timeupdated", spinbox.value.toString());
                    weather0.timestamp2 = mydb.searchMaxDatatime("timeupdatedISO", spinbox.value.toString());
                    weather0.timestamp3 = mydb.searchMaxDatatime("timeupdateduk", spinbox.value.toString());
                    weather0.timestamp4 = mydb.searchMaxDatatime("disclaimer", spinbox.value.toString());
                    weather0.timestamp5 = mydb.searchMaxDatatime("chartName", spinbox.value.toString());
                    weather0.timestamp6 = mydb.searchMaxDatatime("bpiUSDcode", spinbox.value.toString());
                    weather0.timestamp7 = mydb.searchMaxDatatime("bpiUSDsymbol", spinbox.value.toString());
                    weather0.timestamp8 = mydb.searchMaxDatatime("bpiUSDrate", spinbox.value.toString());
                    weather0.timestamp9 = mydb.searchMaxDatatime("bpiUSDdescription", spinbox.value.toString());
                    weather0.timestamp10 = mydb.searchMaxDatatime("bpiUSDrate_float", spinbox.value.toString());

                    weather0.timestamp11 = mydb.searchMaxDatatime("bpiGBPcode", spinbox.value.toString());
                    weather0.timestamp12 = mydb.searchMaxDatatime("bpiGBPsymbol", spinbox.value.toString());
                    weather0.timestamp13 = mydb.searchMaxDatatime("bpiGBPrate", spinbox.value.toString());
                    weather0.timestamp14 = mydb.searchMaxDatatime("bpiGBPdescription", spinbox.value.toString());
                    weather0.timestamp15 = mydb.searchMaxDatatime("bpiGBPrate_float", spinbox.value.toString());

                    weather0.timestamp16 = mydb.searchMaxDatatime("bpiEURcode", spinbox.value.toString());
                    weather0.timestamp17 = mydb.searchMaxDatatime("bpiEURsymbol", spinbox.value.toString());
                    weather0.timestamp18 = mydb.searchMaxDatatime("bpiEURrate", spinbox.value.toString());
                    weather0.timestamp19 = mydb.searchMaxDatatime("bpiEURdescription", spinbox.value.toString());
                    weather0.timestamp20 = mydb.searchMaxDatatime("bpiEURrate_float", spinbox.value.toString());
                    }
                }


                Text {
                    id: appBridgeText1
                    font.pixelSize: 12
                    anchors.top: spinbox.bottom
                    text: "timeupdated = " + timestamp1
                }

                Text {
                    id: appBridgeText2
                    font.pixelSize: 12
                    anchors.top: appBridgeText1.bottom
                    text: "timeupdatedISO = " + timestamp2
                }

                Text {
                    id: appBridgeText3
                    font.pixelSize: 12
                    anchors.top: appBridgeText2.bottom
                    text: "timeupdateduk = " + timestamp3
                }

                Text {
                    id: appBridgeText4
                    font.pixelSize: 12
                    width: parent.width
                    wrapMode: Text.WrapAnywhere
                    anchors.top: appBridgeText3.bottom
                    text: "disclaimer = " + timestamp4
                }

                Text {
                    id: appBridgeText5
                    font.pixelSize: 12
                    anchors.top: appBridgeText4.bottom
                    text: "chartName = " + timestamp5
                }

                Text {
                    id: appBridgeText6
                    font.pixelSize: 12
                    anchors.top: appBridgeText5.bottom
                    text: "bpiUSDcode = " + timestamp6
                }

                Text {
                    id: appBridgeText7
                    font.pixelSize: 12
                    anchors.top: appBridgeText6.bottom
                    text: "bpiUSDsymbol = " + timestamp7
                }

                Text {
                    id: appBridgeText8
                    font.pixelSize: 12
                    anchors.top: appBridgeText7.bottom
                    text: "bpiUSDrate = " + timestamp8
                }

                Text {
                    id: appBridgeText9
                    font.pixelSize: 12
                    anchors.top: appBridgeText8.bottom
                    text: "bpiUSDdescription = " + timestamp9
                }

                Text {
                    id: appBridgeText10
                    font.pixelSize: 12
                    anchors.top: appBridgeText9.bottom
                    text: "bpiUSDrate_float = " + timestamp10
                }

                Text {
                    id: appBridgeText11
                    font.pixelSize: 12
                    anchors.top: appBridgeText10.bottom
                    text: "bpiGBPcode = " + timestamp11
                }

                Text {
                    id: appBridgeText12
                    font.pixelSize: 12
                    anchors.top: appBridgeText11.bottom
                    text: "bpiGBPsymbol = " + timestamp12
                }

                Text {
                    id: appBridgeText13
                    font.pixelSize: 12
                    anchors.top: appBridgeText12.bottom
                    text: "bpiGBPrate = " + timestamp13
                }

                Text {
                    id: appBridgeText14
                    font.pixelSize: 12
                    anchors.top: appBridgeText13.bottom
                    text: "bpiGBPrate_float = " + timestamp14
                }

                Text {
                    id: appBridgeText15
                    font.pixelSize: 12
                    anchors.top: appBridgeText14.bottom
                    text: "bpiEURcode = " + timestamp15
                }

                Text {
                    id: appBridgeText16
                    font.pixelSize: 12
                    anchors.top: appBridgeText15.bottom
                    text: "bpiEURsymbol = " + timestamp16
                }

                Text {
                    id: appBridgeText17
                    font.pixelSize: 12
                    anchors.top: appBridgeText16.bottom
                    text: "bpiEURrate = " + timestamp17
                }

                Text {
                    id: appBridgeText18
                    font.pixelSize: 12
                    anchors.top: appBridgeText17.bottom
                    text: "bpiEURdescription = " + timestamp18
                }
                Text {
                    id: appBridgeText19
                    font.pixelSize: 12
                    anchors.top: appBridgeText18.bottom
                    text: "bpiEURrate_float = " + timestamp19
                }


            }
        }

        Item {
            id: appBridgeItem2

            Rectangle {
                anchors.fill: parent

                Button {
                    id: buttonSwipe2USD
                    anchors.top: parent.top
                    anchors.left:  parent.left
                    text: "HOME"
                    onClicked: {
                        viewSwipeView.setCurrentIndex(0);
                    }
                }
                Text {
                    id: appBridgeItem2Text2
                    anchors.top: parent.top
                    anchors.left:  buttonSwipe2USD.right
                    text: "Corrent USD <=> Bitcoin:"
                    font.pixelSize: 16
                    font.bold: true
                    padding: 5
                }

                TextEdit {
                    id: textEdit2
                    anchors.top: appBridgeItem2Text2.bottom
                    wrapMode: TextEdit.Wrap
                }
            }
        }

        Item {
            id: appBridgeItem3

            Rectangle {
                anchors.fill: parent

                Button {
                    id: buttonSwipe2BPH
                    anchors.top: parent.top
                    anchors.left:  parent.left
                    text: "HOME"
                    onClicked: {
                        viewSwipeView.setCurrentIndex(0);
                    }
                }

                Text {
                    id: appBridgeItem3Text2
                    anchors.top: parent.top
                    anchors.left:  buttonSwipe2BPH.right
                    text: "Corrent BPD <=> Bitcoin:"
                    font.pixelSize: 16
                    font.bold: true
                    padding: 5
                }

                 TextEdit {
                    id: textEdit3
                    anchors.top: appBridgeItem3Text2.bottom
                    wrapMode: TextEdit.Wrap

                 }

            }
        }

        Item {
            id: appBridgeItem4

            Rectangle {
                anchors.fill: parent

                Button {
                    id: buttonSwipe2EUR
                    anchors.top: parent.top
                    anchors.left:  parent.left
                    text: "HOME"
                    onClicked: {
                        viewSwipeView.setCurrentIndex(0);
                    }
                }

                Text {
                    id: appBridgeItem4Text2
                    anchors.top: parent.top                    
                    anchors.left:  buttonSwipe2EUR.right
                    text: "Corrent ERO <=> Bitcoin:"
                    font.pixelSize: 16
                    font.bold: true
                    padding: 5
                }

                 TextEdit {
                     id: textEdit4
                     wrapMode: TextEdit.Wrap
                    anchors.top: appBridgeItem4Text2.bottom

                 }


            }
        }

        Item {
            id: appBridgeItem5

            Rectangle {
                anchors.fill: parent

                Button {
                    id: buttonSwipe2QAboute
                    anchors.top: parent.top
                    anchors.left:  parent.left
                    text: "HOME"
                    onClicked: {
                        viewSwipeView.setCurrentIndex(0);
                    }
                }

                Text {
                    id: appBridgeItem5Text2
                    anchors.top: parent.top
                    anchors.left:  buttonSwipe2QAboute.right
                    text: "Aboute this\n"
                    font.pixelSize: 16
                    font.bold: true
                    padding: 5
                }

                Text {
                    id: appBridgeItem5Text1
                    anchors.top: appBridgeItem5Text2.bottom
                    textFormat: Text.RichText
                    anchors.centerIn: parent.Center
                    text:  "<div>online database Bitcoin DATA API<br>
                            <a href=https://api.coindesk.com/v1/bpi/currentprice.json>https://api.coindesk.com/v1/bpi/currentprice.json</a><br>
                            1 TASK: get data from API apirest.cpp<br>
                            2 TASK: write data to MySQL database SqlLiteDatabase.cpp<br>
                            3 TASK: prepare all MVC process in mainwindow.cpp<br>
                            4 TASK: view data in QML (prepare QML controller in main.cpp)<br>
                            5 TASL: view data in chart.js<br>
                            <a href=https://github.com/qyvlik/Chart.qml>https://github.com/qyvlik/Chart.qml</a><br>
                            </div>"
                }


            }
        }

    }

    PageIndicator {
        id: pageIndicator

        height: 20

        count: viewSwipeView.count
        currentIndex: viewSwipeView.currentIndex

        anchors.bottom: viewSwipeView.bottom
        anchors.horizontalCenter: viewSwipeView.horizontalCenter

        background:    Rectangle {
            width: width
            height: height
            color: "white"
            border.color: "red"
            border.width: 0
            radius: 5
        }
    }

}
