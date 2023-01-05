import 'package:flutter/material.dart';
import 'package:flutter_application_databasee/pages/homePage.dart';
import 'package:flutter_application_databasee/pagesApp/Component.dart';
import 'package:flutter_application_databasee/pagesApp/HomePage.dart';
import 'package:flutter_application_databasee/pagesApp/RegisterPage.dart';
import 'package:flutter_application_databasee/pagesApp/loginPage.dart';

import 'Database.dart/Queries.dart';
SqlDb sqldb = SqlDb();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
