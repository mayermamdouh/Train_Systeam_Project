import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class SqlDb {
  static Database? _database;
  Future<Database?> get db async {
    // to ensure the table Crate or not to make intialDb one time not many time
    if (_database == null) {
      _database = await intialDb();
      return _database;
    } else {
      return _database;
    }
  }

  intialDb() async {
    String Databasepath = await getDatabasesPath(); //path al database 2ftrade
    String path = join(Databasepath, 'DataBaseSqflite.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreare, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) {
    print('onUpgrade Function============================');
  }

  _onCreare(Database db, int version) async {
    await db.execute(''' 
     CREATE TABLE Customer(
     "UserName" TEXT NOT NULL PRIMARY KEY ,
     "Password" TEXT NOT NULL,
     "PhoneNumber" INTEGER NOT NULL,
     "CustomerEmail" TEXT NOT NULL,
     "City" TEXT NOT NULL,
     "State" TEXT NOT NULL,
     "Gender" TEXT NOT NULL,
     "Age" INTEGER NOT NULL
     )
     ''');

    await db.execute(''' 
     CREATE TABLE "Ticket"(
     "TicketNO" INTEGER NOT NULL PRIMARY KEY ,
     "SeatNO" INTEGER NOT NULL,
     "PassengerName" TEXT NOT NULL,
     "CartNO" INTEGER NOT NULL,
     "DateTime" TEXT NOT NULL,
     "Class" TEXT NOT NULL,
     "Fare" INTEGER NOT NULL,
     "Source" TEXT NOT NULL,
     "Destination" TEXT NOT NULL
     )
     ''');
    print('Ticket ===================================');

    await db.execute(''' 
     CREATE TABLE "Payment"(
     "cardNumber" Text NOT NULL  ,
     "expiryDate" Text NOT NULL  ,
     "cardHolderName" Text NOT NULL PRIMARY KEY  ,
     "cvvCode" Text NOT NULL  
   
     )
     ''');

    await db.execute(''' 
     CREATE TABLE "Train"(
     "Destnation" Text NOT NULL  ,
     "Train_Number" Text NOT NULL PRIMARY KEY ,
     "Train_Name" Text NOT NULL  ,
      "Arrival_ Time" Text NOT NULL  ,
     "Departure_Time" Text NOT NULL  ,
     "Distance" Text NOT NULL
     )
     ''');


    //  "Password" TEXT NOT NULL,
    //  "PhoneNumber" INTEGER NOT NULL,
    //  "CustomerEmail" TEXT NOT NULL,
    //  "City" TEXT NOT NULL,
    //  "State" TEXT NOT NULL,
    //  "Gender" TEXT NOT NULL,
    //  "Age" INTEGER NOT NULL

    // lw i need to crate another table  await db.execute(''' w create al table ''');
    // A BLOB (large binary object) is an SQLite data type that stores large objects, typically large files such as images,
    //al two () al b3d al 2sm al Table dol 27ot fehom 2same al column
    //AUTOINCREMENT +1 BY ADD ITEM
    print("CREATE===================================================");
  }

  ReadDataFromDatabase(String sql) async {
    Database? read = await db;
    List<Map> response = await read!.rawQuery(sql);
    return response;
  } //Select Data the same MySql
// rawQuery('b7ot hna la select ');

  InsertDataFromDatabase(String sql) async {
    Database? read = await db;
    int response = await read!.rawInsert(sql);
    return response;
  } // return number of raw

  UpDateDataFromDatabase(String sql) async {
    Database? read = await db;
    int response = await read!.rawUpdate(sql);
    return response;
  }

  DeleteDataFromDatabase(String sql) async {
    Database? read = await db;
    int response = await read!.rawDelete(sql);
    return response;
  }
//Select
//Delete
//Update
//Insert
}

// Future<String> get _localPath async {
//   final directory = await getApplicationDocumentsDirectory();

//   return directory.path;
// }

// Future<File> get _localFile async {
//   final path = await _localPath;
//   return File('$path/Database.txt');
// }

// Future<File> writeData(int counter) async {
//   final file = await _localFile;
//   // Write the file
//   return file.writeAsString('$counter');
// }

// Future<int> readData() async {
//   try {
//     final file = await _localFile;
//     // Read the file
//     final contents = await file.readAsString();
//     return int.parse(contents);
//   } catch (e) {
//     return 0;
//   }
// }
