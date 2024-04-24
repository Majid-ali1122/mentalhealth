import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/utils.dart';
import 'package:mentalhealth/ReportScreen.dart';
import 'package:mentalhealth/constants.dart';
import 'package:mentalhealth/quiz_screen.dart';

import 'models/Questions.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<WelcomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
           alignment: Alignment.center,
            margin: EdgeInsets.all(20),
            child:
            Column( children: [
              Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  Flexible(
                    child: Text(
                     "title".tr,
                     style: TextStyle(
                         color: Colors.black,
                         fontSize: 24,
                         fontWeight: FontWeight.bold
                     ),
                 ),
                  ),
                 Icon(Icons.settings , color: Colors.black,size: 30,)
               ],
             ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: welcomeback,
                  borderRadius: BorderRadius.circular(8),
                ),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.circle , color: bluedot,size: 12,),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text(
                            "dashhello".tr,
                            style: TextStyle(
                                color: textwelcome,
                                fontSize: 13,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        Text(
                          "dashslogan".tr,
                          style: TextStyle(
                              color: textwelcome,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        _nextButton("assets/images/Reports.svg" , "report"),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                            "Available soon...",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],

                    ),
                    _nextButton("assets/images/gad7.svg" , "g7"),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _nextButton("assets/images/phq9.svg" , "p9"),
                  _nextButton("assets/images/wsas.svg" , "wsas"),
                ],
              ),
            _nextButton("assets/images/combine.svg", "combine"),



            ]),
          ),
        ),
      ),
    );
  }



  _nextButton(String text , String type) {

    return GestureDetector(
      onTap: (){
        if(type == "report")
          {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) =>  Report(type: type)),
            // );
          }
        else
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  QuizScreen(type: type)),
            );
          }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: SvgPicture.asset(
           text
        ),
      ),
    );
  }


}
