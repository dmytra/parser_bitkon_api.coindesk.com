#ifndef SQLLITEDATABASE_H
#define SQLLITEDATABASE_H

#include <QSqlDatabase>
#include <QSqlDriver>
#include <QSqlError>
#include <QSqlQuery>

#include <QObject>
#include <QDebug>

class SqlLiteDatabase : public QObject
{
    Q_OBJECT
public:
    explicit SqlLiteDatabase (QObject* parent = 0);

    void    databaseConnect();
    void    databaseInit();
    void    databasePopulate(QStringList);

    QStringList  allDBdata;

    Q_INVOKABLE QString searchMaxDatatime(QString mInputText, QString mInputText2 )
    {
       QSqlQuery query;

//select * from APICOINCAPIO where DATETIME in(SELECT MAX(DATETIME) FROM APICOINCAPIO
//https://stackoverflow.com/questions/55998740/mysql-query-with-limit-in-descending-order-doesnt-works
//https://itproger.com/ua/course/sql/5
//https://stackoverflow.com/questions/11381674/sql-selecting-all-rows-with-maximum-value

       if (mInputText == "timeupdated")
            query.prepare("SELECT timeupdated FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "timeupdatedISO")
            query.prepare("SELECT timeupdatedISO FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "timeupdateduk")
            query.prepare("SELECT timeupdateduk FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "disclaimer")
            query.prepare("SELECT disclaimer FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "chartName")
            query.prepare("SELECT chartName FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiUSDcode")
            query.prepare("SELECT bpiUSDcode FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiUSDsymbol")
            query.prepare("SELECT bpiUSDsymbol FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiUSDrate")
            query.prepare("SELECT bpiUSDrate FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiUSDdescription")
            query.prepare("SELECT bpiUSDdescription FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiUSDrate_float")
            query.prepare("SELECT bpiUSDrate_float FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");

       if (mInputText == "bpiGBPcode")
            query.prepare("SELECT bpiGBPcode FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiGBPsymbol")
            query.prepare("SELECT bpiGBPsymbol FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiGBPrate")
            query.prepare("SELECT bpiGBPrate FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiGBPdescription")
            query.prepare("SELECT bpiGBPdescription FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiGBPrate_float")
            query.prepare("SELECT bpiGBPrate_float FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");

       if (mInputText == "bpiEURcode")
           query.prepare("SELECT bpiEURcode FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiEURsymbol")
            query.prepare("SELECT bpiEURsymbol FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiEURrate")
            query.prepare("SELECT bpiEURrate FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiEURdescription")
            query.prepare("SELECT bpiEURdescription FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");
       if (mInputText == "bpiEURrate_float")
            query.prepare("SELECT bpiEURrate_float FROM APICOINCAPIO WHERE id = :id ORDER BY id DESC");

        query.bindValue(":id", mInputText2);
        //query.bindValue(":num", mInputText);

       if(!query.exec())
            qWarning() << "MainWindow::OnSearchClicked - ERROR: " << query.lastError().text();

        //qWarning() << mInputText << " " << mInputText2<< " ";

        if(query.first())
            return QString(query.value(0).toString());
        else
            return QString(" #### data not found ### ");
    }

    Q_INVOKABLE QString searchMaxUSD(QString mInputText,QString mInputText2 )
    {
        QSqlQuery query;

        //select * from APICOINCAPIO where DATETIME in(SELECT MAX(DATETIME) FROM APICOINCAPIO
        //https://stackoverflow.com/questions/55998740/mysql-query-with-limit-in-descending-order-doesnt-works
        //https://itproger.com/ua/course/sql/5
        //https://stackoverflow.com/questions/11381674/sql-selecting-all-rows-with-maximum-value

        if (mInputText == "bpiUSDrate_float")
            query.prepare("SELECT MAX(bpiUSDrate_float) FROM APICOINCAPIO ");
        if (mInputText == "bpiGBPrate_float")
            query.prepare("SELECT MAX(bpiGBPrate_float) FROM APICOINCAPIO ");
        if (mInputText == "bpiEURrate_float")
            query.prepare("SELECT MAX(bpiEURrate_float) FROM APICOINCAPIO ");

        //query.bindValue(":id", mInputText);
        //query.bindValue(":num",  mInputText2);

        if(!query.exec())
            qWarning() << "MainWindow::OnSearchClicked - ERROR: " << query.lastError().text();

        //qWarning() << mInputText << " " << mInputText2<< " ";

        if(query.first())
            return QString(query.value(0).toString());
        else
            return QString(" #### data not found ### ");
    }

    Q_INVOKABLE QString searchCountDatatime(QString mInputText)
    {
        QSqlQuery query;
        query.prepare("SELECT COUNT(timeupdated) FROM APICOINCAPIO");

        if(!query.exec())
            qWarning() << "MainWindow::OnSearchClicked - ERROR: " << query.lastError().text();

        if(query.first())
            return QString(query.value(0).toString());
        else
            return QString(" #### data not found ### ");
    }


    Q_INVOKABLE QString searchCorrentUSD(QString mInputText,QString mInputText2)
    {
        QSqlQuery query;

       if (mInputText == "bpiUSDrate_float")
            query.prepare("SELECT bpiUSDrate_float FROM APICOINCAPIO WHERE id = :num");

       if (mInputText == "bpiGBPrate_float")
            query.prepare("SELECT bpiGBPrate_float FROM APICOINCAPIO WHERE id = :num");

       if (mInputText == "bpiEURrate_float")
            query.prepare("SELECT bpiEURrate_float FROM APICOINCAPIO WHERE id = :num");

        query.bindValue(":num", mInputText2 );

        if(!query.exec())
            qWarning() << "MainWindow::OnSearchClicked - ERROR: " << query.lastError().text();

       // qWarning() << mInputText << " " << mInputText2<< " ";

        if(query.first())
            return QString(query.value(0).toString());
        else
            return QString(" #### data not found ### ");
    }

// https://www.tutorialspoint.com/how-to-select-next-row-pagination-in-mysql
// select DATETIME from APICOINCAPIO WHERE rank = 1 order by DATETIME desc limit 1,1;
//  select DATETIME from APICOINCAPIO WHERE rank = :num limit :id,1;

};

#endif // SQLLITEDATABASE_H
