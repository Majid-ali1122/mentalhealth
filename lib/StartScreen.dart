import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mentalhealth/ReportScreen.dart';
import 'package:mentalhealth/WelcomeScreen.dart';
import 'package:mentalhealth/constants.dart';
import 'package:mentalhealth/quiz_screen.dart';

import 'models/Questions.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<StartScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Stack(
        alignment: Alignment.center,
        children: [
         SvgPicture.asset("assets/images/bg.svg" ,
         alignment: Alignment.center,
           fit: BoxFit.fill,
         ),
          Container(

            alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [

                 Text(
                      "starttitle".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  SizedBox(height: 10,),
                  Text(
                    "startdesc".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) =>  WelcomeScreen()),
                      );
                    },
                      child: SvgPicture.asset("assets/images/Okay.svg")),
                  SizedBox(height: 5,),
                  Text(
                    "Okay",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal
                    ),
                  ),




            ]),
          ),
        ],
      ),


    );
  }




}
