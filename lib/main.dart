import 'package:flutter/material.dart';
import 'package:foodapp/src/pages/details_page.dart';
import 'package:foodapp/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Comida",
      initialRoute: '/',
      routes: {
        "/": (BuildContext context) => HomePage(),
        "detalles": (BuildContext context) => DetallesPage()
      },
    );
  }
}

