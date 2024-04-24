import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentalhealth/Languages.dart';



import 'StartScreen.dart';
import 'WelcomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      translations: Languages(),
      locale: const Locale('so' , 'SO'),
      fallbackLocale: const Locale('en' , 'US'),
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
