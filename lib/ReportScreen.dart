import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mentalhealth/constants.dart';
import 'package:mentalhealth/quiz_screen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'models/Questions.dart';

class Report extends StatefulWidget {
  final String type;
  final int score;
  // final String type;

  const Report({super.key, required this.type, required this.score});
  @override
  State<Report> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<Report> {
 String title="";
 String howsevere="";
 Color colorss= grey;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.type == "g7")
      {
        if (widget.score  < 5) {
          title = "op1".tr;
          howsevere = "Normal";
          colorss = grey;
        }
        else if(widget.score >= 5 && widget.score < 10 )
        {
          title = "op2".tr;
          howsevere = "mild".tr;
          colorss = lightblue;
        }
        else if(widget.score >= 10 && widget.score < 15 )
        {
          title = "op3".tr;
          howsevere = "mod".tr;
          colorss = bluedot;
        }
        else
        {
          title = "op4".tr;
          howsevere = "severe".tr;
          colorss = darkblue;
        }
      }
    else if(widget.type == "p9")
      {
        if (widget.score  < 5) {
          title = "op5".tr;
          howsevere = "Normal";
          colorss = grey;
        }
        else if(widget.score >= 5 && widget.score < 10 )
        {
          title = "op6".tr;
          howsevere = "mild".tr;
          colorss = lightblue;
        }
        else if(widget.score >= 10 && widget.score < 15 )
        {
          title = "op7".tr;
          howsevere = "mod".tr;
          colorss = bluedot;
        }
        else if(widget.score >= 15 && widget.score < 20 )
        {
          title = "op8".tr;
          howsevere = "mod".tr;
          colorss = bluedot;
        }
        else
        {
          title = "op9".tr;
          howsevere = "severe".tr;
          colorss = darkblue;
        }
      }
    else if(widget.type == "wsas")
      {

        if (widget.score  <= 7) {
          title = "op10".tr;
          howsevere = "Normal";
          colorss = grey;
        }
        else if(widget.score >= 8 && widget.score <= 12 )
        {
          title = "op11".tr;
          howsevere = "mild".tr;
          colorss = lightblue;
        }
        else if(widget.score >= 10 && widget.score <= 16 )
        {
          title = "op12".tr;
          howsevere = "mod".tr;
          colorss = bluedot;
        }
        else
        {
          title = "op13".tr;
          howsevere = "severe".tr;
          colorss = darkblue;
        }

      }
    else
      {

        if (widget.score  < 5) {
          title = "op14".tr;
          howsevere = "Normal";
          colorss = grey;
        }
        else if(widget.score >= 5 && widget.score < 10 )
        {
          title ="op15".tr;
          howsevere = "mild".tr;
          colorss = lightblue;
        }
        else if(widget.score >= 10 && widget.score < 15 )
        {
          title = "op16".tr;
          howsevere = "mod".tr;
          colorss = bluedot;
        }
        else
        {
          title = "op17".tr;
          howsevere = "severe".tr;
          colorss = darkblue;
        }
      }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,

            child:

            Column(children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.arrow_back ,size: 30, color: Colors.black,)),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text(
                        widget.type == "g7" ? "GAD-7 Score" : widget.type == "p9" ?
                        "PHQ-9 Score" : widget.type == "wsas" ?
                        "WSAS Score" : "GAD-7 and PHQ-9 Score"
                        ,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Icon(Icons.settings , color: Colors.black,size: 30,)
                  ],
                ),
              ),
              // SvgPicture.asset(
              //     "assets/images/download.svg"
              // ),

              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      child: SfLinearGauge(
                        minimum: 0.0,
                        maximum: 20.0,
                        interval: 5,

                        ranges: [
                          LinearGaugeRange(
                            edgeStyle: LinearEdgeStyle.startCurve,
                            startValue: 0,
                            endValue: 5,
                            startWidth: 15,
                            endWidth: 15,
                            color: grey,
                          ),
                          LinearGaugeRange(
                            startValue: 5,
                            endValue: 10,
                            startWidth: 15,
                            endWidth: 15,
                            color: lightblue,
                          ),
                          LinearGaugeRange(
                            startValue: 10,
                            endValue: 15,
                            startWidth: 15,
                            endWidth: 15,
                            color: bluedot,
                          ),
                          LinearGaugeRange(
                            edgeStyle: LinearEdgeStyle.endCurve,
                            startValue: 15,
                            endValue: 20,
                            startWidth: 15,
                            endWidth: 15,
                            color: darkblue,
                          ),
                         widget.type == "p9" ? LinearGaugeRange(
                            edgeStyle: LinearEdgeStyle.endCurve,
                            startValue: 20,
                            endValue: 26,
                            startWidth: 15,
                            endWidth: 15,
                            color: darkblue,
                          ) : LinearGaugeRange(startValue: 0,endValue: 0,),
                        ],
                        orientation: LinearGaugeOrientation.vertical,
                        majorTickStyle: LinearTickStyle(length: 0 , thickness: 0),

                        animateAxis: true,
                        axisTrackStyle: LinearAxisTrackStyle(thickness: 0),
                        axisLabelStyle: TextStyle(fontSize: 12.0, color: darkblue , fontWeight:
                        FontWeight.bold
                        ),
                      ),
                      height: 320,
                      margin: EdgeInsets.all(0),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 15, color: colorss)
                            ),
                            child: Text(widget.score.toString() , style: TextStyle(
                                fontWeight: FontWeight.bold , fontSize: 40,
                              color: colorss
                            ),),
                          ),
                          SizedBox(height: 20,),
                          Text(howsevere , style: TextStyle(
                              fontWeight: FontWeight.bold , fontSize: 24,
                            color: colorss
                          ),),
                        ],
                      ),
                    ),
                  ],

                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle , color: lightblue, size: 12,),
                        SizedBox(width: 5,),
                        Text("mild".tr , style: TextStyle(
                            fontWeight: FontWeight.bold , fontSize: 19 , color: lightblue
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.circle , color: bluedot, size: 12,),
                        SizedBox(width: 5,),
                        Text("mod".tr , style: TextStyle(
                            fontWeight: FontWeight.bold , fontSize: 19 , color: bluedot
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.circle , color: darkblue, size: 12,),
                        SizedBox(width: 5,),
                        Text("severe".tr , style: TextStyle(
                            fontWeight: FontWeight.bold , fontSize: 19 , color: darkblue
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: welcomeback,
                borderRadius: BorderRadius.circular(10),
              ),
            child: Column(
              children: [
                Text( "${"firstline".tr} ${"secline".tr} ${widget.score} ${"thirdline".tr} ${title}."
                   , style: TextStyle(
                   fontSize: 14 , color: Colors.black
                ),),
                howsevere != "Normal" ?  SizedBox(height: 10,) :SizedBox(),
              howsevere != "Normal" ?   Text("forthline".tr+
                    " ${"fifthline".tr}" , style: TextStyle(
                    fontSize: 14 , color: Colors.black
                ),) : SizedBox(),
                howsevere != "Normal" ? SizedBox(height: 10,): SizedBox(),
                howsevere != "Normal" ? Text("${"sixthline".tr}" , style: TextStyle(
                   fontSize: 14 , color: Colors.black
                ),) : SizedBox(),
                howsevere != "Normal" ?  SizedBox(height: 10,) : SizedBox(),
                howsevere != "Normal" ? Linkify(
              onOpen: (link) => print("Clicked ${link.url}!"),
              text: "${"sevenline".tr} (www.nhs.uk)",
            ) : SizedBox(),

              ],
            ),
          ),
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
