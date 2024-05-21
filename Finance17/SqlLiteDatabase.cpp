#include "sqllitedatabase.h"

#include "apirest.h"
#include <QStandardPaths>

SqlLiteDatabase::SqlLiteDatabase(QObject *parent) : QObject(parent)
{

}

// TODO: Make this a static function of class Database.
void SqlLiteDatabase::databaseConnect()
{
    const QString DRIVER("QSQLITE");

    if(QSqlDatabase::isDriverAvailable(DRIVER))
    {
        QSqlDatabase db = QSqlDatabase::addDatabase(DRIVER);

        //https://stackoverflow.com/questions/52337354/how-to-write-files-to-an-android-device-using-qt
        QString path = QStandardPaths::writableLocation(QStandardPaths::DownloadLocation);
        db.setDatabaseName(path+"/"+"APICOINCAPIO.db");

        //db.setDatabaseName("APICOINCAPIO.db"); //(":memory:");

        if(!db.open())
            qWarning() << "MainWindow::DatabaseConnect - ERROR: " << db.lastError().text();
    }
    else
            qWarning() << "MainWindow::DatabaseConnect - ERROR: no driver " << DRIVER << " available";

}


// TODO: Make this a static function of class Database.
void SqlLiteDatabase::databaseInit()
{
    QSqlQuery query;
    if(!query.exec("CREATE TABLE APICOINCAPIO ("
                    "ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
                    "timeupdated          TEXT    NOT NULL,"
                    "timeupdatedISO       TEXT    NOT NULL,"
                    "timeupdateduk        TEXT    NOT NULL,"
                    "disclaimer           TEXT    NOT NULL,"
                    "chartName            TEXT    NOT NULL,"
                    "bpiUSDcode           TEXT    NOT NULL,"
                    "bpiUSDsymbol         TEXT    NOT NULL,"
                    "bpiUSDrate           TEXT    NOT NULL,"
                    "bpiUSDdescription    TEXT    NOT NULL,"
                    "bpiUSDrate_float     TEXT    NOT NULL,"
                    "bpiGBPcode           TEXT    NOT NULL,"
                    "bpiGBPsymbol         TEXT    NOT NULL,"
                    "bpiGBPrate           TEXT    NOT NULL,"
                    "bpiGBPdescription    TEXT    NOT NULL,"
                    "bpiGBPrate_float     TEXT    NOT NULL,"
                    "bpiEURcode           TEXT    NOT NULL,"
                    "bpiEURsymbol         TEXT    NOT NULL,"
                    "bpiEURrate           TEXT    NOT NULL,"
                    "bpiEURdescription    TEXT    NOT NULL,"
                    "bpiEURrate_float     TEXT    NOT NULL"
                    ")")){
        qDebug()<<query.lastError().text();
    }
}

// TODO: Make this a static function of class Database.
void SqlLiteDatabase::databasePopulate(QStringList allDBdata)
{
    QSqlQuery query;

    QString timeupdated = allDBdata.at(0);
    QString timeupdatedISO = allDBdata.at(1);
    QString timeupdateduk = allDBdata.at(2);
    QString disclaimer = allDBdata.at(3);
    QString chartName = allDBdata.at(4);
    QString bpiUSDcode = allDBdata.at(5);
    QString bpiUSDsymbol = allDBdata.at(6);
    QString bpiUSDrate = allDBdata.at(7);
    QString bpiUSDdescription = allDBdata.at(8);
    QString bpiUSDrate_float = allDBdata.at(9);
    QString bpiGBPcode = allDBdata.at(10);
    QString bpiGBPsymbol = allDBdata.at(11);
    QString bpiGBPrate = allDBdata.at(12);
    QString bpiGBPdescription = allDBdata.at(13);
    QString bpiGBPrate_float = allDBdata.at(14);
    QString bpiEURcode = allDBdata.at(15);
    QString bpiEURsymbol = allDBdata.at(16);
    QString bpiEURrate = allDBdata.at(17);
    QString bpiEURdescription = allDBdata.at(18);
    QString bpiEURrate_float = allDBdata.at(19);

    // timeupdated, timeupdatedISO, timeupdateduk, disclaimer, chartName,
    // bpiUSDcode, bpiUSDsymbol, bpiUSDrate, bpiUSDdescription, bpiUSDrate_float,
    // bpiGBPcode, bpiGBPsymbol, bpiGBPrate, bpiGBPrate_float, bpiGBPrate_float,
    // bpiEURcode, bpiEURsymbol, bpiEURrate, bpiEURdescription, bpiEURrate_float

        query.prepare("insert into APICOINCAPIO( timeupdated, timeupdatedISO, timeupdateduk, disclaimer, chartName,  "
                  "bpiUSDcode, bpiUSDsymbol, bpiUSDrate, bpiUSDdescription, bpiUSDrate_float, "
                  "bpiGBPcode, bpiGBPsymbol, bpiGBPrate, bpiGBPdescription, bpiGBPrate_float, "
                  "bpiEURcode, bpiEURsymbol, bpiEURrate, bpiEURdescription, bpiEURrate_float ) "
            "values( :timeupdated, :timeupdatedISO, :timeupdateduk, :disclaimer, :chartName, "
                  ":bpiUSDcode, :bpiUSDsymbol, :bpiUSDrate, :bpiUSDdescription, :bpiUSDrate_float, "
                  ":bpiGBPcode, :bpiGBPsymbol, :bpiGBPrate, :bpiGBPdescription, :bpiGBPrate_float, "
                  ":bpiEURcode, :bpiEURsymbol, :bpiEURrate, :bpiEURdescription, :bpiEURrate_float )");
        query.bindValue(":timeupdated",  timeupdated);
        query.bindValue(":timeupdatedISO", timeupdatedISO);
        query.bindValue(":timeupdateduk", timeupdateduk);
        query.bindValue(":disclaimer", disclaimer);
        query.bindValue(":chartName", chartName);
        query.bindValue(":bpiUSDcode", bpiUSDcode);
        query.bindValue(":bpiUSDsymbol",  bpiUSDsymbol);
        query.bindValue(":bpiUSDrate", bpiUSDrate);
        query.bindValue(":bpiUSDdescription", bpiUSDdescription);
        query.bindValue(":bpiUSDrate_float", bpiUSDrate_float);
        query.bindValue(":bpiGBPcode", bpiGBPcode);
        query.bindValue(":bpiGBPsymbol", bpiGBPsymbol);
        query.bindValue(":bpiGBPrate", bpiGBPrate);
        query.bindValue(":bpiGBPdescription", bpiGBPdescription);
        query.bindValue(":bpiGBPrate_float", bpiGBPrate_float);
        query.bindValue(":bpiEURcode", bpiEURcode);
        query.bindValue(":bpiEURsymbol", bpiEURsymbol);
        query.bindValue(":bpiEURrate", bpiEURrate);
        query.bindValue(":bpiEURdescription", bpiEURdescription);
        query.bindValue(":bpiEURrate_float", bpiEURrate_float);
        if(!query.exec()){
            qDebug()<<query.lastError().text();
        }

}
