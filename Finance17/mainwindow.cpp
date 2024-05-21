#include "mainwindow.h"
#include <QJsonArray>

MainWindow::MainWindow()
{
    timerId = startTimer(10000);

    sqlLiteDB.databaseConnect();
    sqlLiteDB.databaseInit();
}

// https://stackoverflow.com/questions/53364083/search-items-in-qjsonarray
QJsonObject MainWindow::findValueFromJsonArray(QJsonArray arr, QString key, int val) {
    for (const auto obj : arr) {
        if (obj.toObject().value(key) == val)
            return obj.toObject();
    }
    return QJsonObject();
}

void MainWindow::timerEvent(QTimerEvent *event)
{
    apirest.setAptRequest("https://api.coindesk.com/v1/bpi/currentprice.json");

        QJsonObject jsonObj = apirest.JsonData();

        QString decodedData = "";

        QString timeupdated = " ";
        QString timeupdatedISO = " ";
        QString timeupdateduk = " ";
        QString disclaimer = " ";
        QString chartName = " ";

        QString bpiUSDcode = "  ";
        QString bpiUSDsymbol = " ";
        QString bpiUSDrate = " ";
        QString bpiUSDdescription = " ";
        QString bpiUSDrate_float = " ";

        QString bpiGBPcode = " ";
        QString bpiGBPsymbol = " ";
        QString bpiGBPrate = " ";
        QString bpiGBPdescription = " ";
        QString bpiGBPrate_float = " ";

        QString bpiEURcode = " ";
        QString bpiEURsymbol = " ";
        QString bpiEURrate = " ";
        QString bpiEURdescription = " ";
        QString bpiEURrate_float = " ";

        QStringList allDBdata;

        QJsonObject objDataObjectTime = jsonObj.value("time").toObject();

        if(objDataObjectTime.value("updated").toString()!=nullptr) timeupdated = objDataObjectTime.value("updated").toString();
        if(objDataObjectTime.value("updatedISO").toString()!=nullptr) timeupdatedISO = objDataObjectTime.value("updatedISO").toString();
        if(objDataObjectTime.value("updateduk").toString()!=nullptr) timeupdateduk = objDataObjectTime.value("updateduk").toString();

        if(jsonObj["disclaimer"].toString()!=nullptr) disclaimer = jsonObj["disclaimer"].toString();
        if(jsonObj["chartName"].toString()!=nullptr) chartName = jsonObj["chartName"].toString();

        // https://stackoverflow.com/questions/46851685/how-to-access-element-of-json-using-qt
        //qDebug()<<jsonObj.value("bpi").toObject().value("USD").toObject().value("description").toString();

        bpiUSDcode = jsonObj.value("bpi").toObject().value("USD").toObject().value("code").toString();
        bpiUSDsymbol = jsonObj.value("bpi").toObject().value("USD").toObject().value("symbol").toString();
        bpiUSDrate = jsonObj.value("bpi").toObject().value("USD").toObject().value("rate").toString();
        bpiUSDdescription = jsonObj.value("bpi").toObject().value("USD").toObject().value("description").toString();
        double bpiUSDrate_floatToFloat = jsonObj.value("bpi").toObject().value("USD").toObject().value("rate_float").toDouble();
        bpiUSDrate_float.setNum(bpiUSDrate_floatToFloat);

        bpiGBPcode = jsonObj.value("bpi").toObject().value("GBP").toObject().value("code").toString();
        bpiGBPsymbol = jsonObj.value("bpi").toObject().value("GBP").toObject().value("symbol").toString();
        bpiGBPrate = jsonObj.value("bpi").toObject().value("GBP").toObject().value("rate").toString();
        bpiGBPdescription = jsonObj.value("bpi").toObject().value("GBP").toObject().value("description").toString();
        double bpiGBPrate_floatToFloat = jsonObj.value("bpi").toObject().value("GBP").toObject().value("rate_float").toDouble();
        bpiGBPrate_float.setNum(bpiGBPrate_floatToFloat);

        bpiEURcode = jsonObj.value("bpi").toObject().value("EUR").toObject().value("code").toString();
        bpiEURsymbol = jsonObj.value("bpi").toObject().value("EUR").toObject().value("symbol").toString();
        bpiEURrate = jsonObj.value("bpi").toObject().value("EUR").toObject().value("rate").toString();
        bpiEURdescription = jsonObj.value("bpi").toObject().value("EUR").toObject().value("description").toString();
        double bpiEURrate_floatToFloat = jsonObj.value("bpi").toObject().value("EUR").toObject().value("rate_float").toDouble();
        bpiEURrate_float.setNum(bpiEURrate_floatToFloat);

        allDBdata = { timeupdated, timeupdatedISO, timeupdateduk, disclaimer, chartName,
                     bpiUSDcode, bpiUSDsymbol, bpiUSDrate, bpiUSDdescription, bpiUSDrate_float,
                     bpiGBPcode, bpiGBPsymbol, bpiGBPrate, bpiGBPdescription, bpiGBPrate_float,
                     bpiEURcode, bpiEURsymbol, bpiEURrate, bpiEURdescription, bpiEURrate_float};

        if (timeupdated!=" ")
            sqlLiteDB.databasePopulate(allDBdata);    
}
