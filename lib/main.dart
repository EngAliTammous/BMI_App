import 'package:flutter/material.dart';
import 'package:bmi_app/screens/lunch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI APP',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.black , // background
        textTheme: const TextTheme(
          headline3: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold),
        ),
        iconTheme:const IconThemeData(color: Colors.white,size: 90),
        appBarTheme:const AppBarTheme(iconTheme: IconThemeData(size: 30,))

      ),
      home: const LunchScreen(),
    );
  }
}
