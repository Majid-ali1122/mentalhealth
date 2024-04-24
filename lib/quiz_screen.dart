import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/utils.dart';
import 'package:mentalhealth/constants.dart';

import 'ReportScreen.dart';
import 'models/Questions.dart';


class QuizScreen extends StatefulWidget {
  final String type;

  const QuizScreen({super.key, required this.type});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //define the datas
  List<Question> questionList=[];
  int currentQuestionIndex = 0;
  int score = 0;
  int finalscore=0;
  Answer? selectedAnswer;
  // bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questionList= widget.type == "g7" ? gad7() : widget.type == "p9" ? phq9() :
    widget.type == "wsas" ? wsas() : combine();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 42),
          child:
              Column(children: [
                Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
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
                    Flexible(
                      child: Text(
                        widget.type == "g7" ? "Generalised Anxiety Disorder (GAD-7)" : widget.type == "p9" ?
                        "Patient Health Questionnaire (PHQ-9)" : widget.type == "wsas" ?
                        "Work and Social Adjustment scale (WSAS)" : "GAD-7 and PHQ-9"
                        ,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),

            SizedBox(height: 10,),
            _questionWidget(),
                SizedBox(height: 40,),
            _answerList(),
                SizedBox(height: 20,),
            _nextButton(),
          ]),
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "qtnumber".tr + "${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: bluedot
            ,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        widget.type == "wsas" ?
    Text(
      "wsastop".tr,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    )
            :
        Text(
          "toptext".tr,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: bluedot,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText.tr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e ,  questionList[currentQuestionIndex]
                .answersList.lastIndexOf(e)),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer, int index) {

   bool isSelected = answer == selectedAnswer;
    return GestureDetector(
      onTap: (){
        // setState(() {

        // });

            if (selectedAnswer == null) {
              finalscore=answer.score;
              // score = score + answer.score;
              setState(() {
                selectedAnswer = answer;
              });
            }
            else
              {
                finalscore=answer.score;
                setState(() {
                  selectedAnswer = answer;
                });
              }
      },
      child: Container(
          height: 70,
          margin: const EdgeInsets.symmetric(vertical: 7),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: welcomeback,
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             widget.type != "wsas" ?  SvgPicture.asset(
               index == 0 ?  "assets/images/opta.svg" :
                   index == 1  ? "assets/images/optd.svg" :
                       index == 2 ? "assets/images/optc.svg" : "assets/images/optb.svg"
                ) :
             index == 4 ?
                 Container(
                   alignment: Alignment.center,
                   width: 36,
                   height: 36,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.green
                   ),
                   child: Text(
                     "E" , style: TextStyle(
                     fontWeight: FontWeight.bold,color: Colors.white,
                     fontSize: 18
                   ),
                   ),
                 )
                 : SvgPicture.asset(
                  index == 0 ?  "assets/images/opta.svg" :
                  index == 1  ? "assets/images/optd.svg" :
                  index == 2 ? "assets/images/optc.svg"  :
                   "assets/images/optb.svg"
              ),
          SizedBox(width: 15,),
          Expanded(
            child: Container(

                child: Text(answer.answerText,style: TextStyle(
                  color:textwelcome,
                  fontWeight: FontWeight.w600
                ),),
              ),
          ),
              isSelected ?  SvgPicture.asset(
                 "assets/images/check.svg"
              ) : SizedBox(),

      ],),
        ),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // GestureDetector(
          //   onTap: (){
          //
          //   },
          //   child: SvgPicture.asset(
          //       "assets/images/prev.svg"
          //   ),
          // ),
          GestureDetector(
            onTap: (){
              score = score + finalscore;
              print(score);
              if (isLastQuestion) {

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  Report(type: widget.type , score: score,)),
                );
              //   showDialog(context: context, builder: (_) => widget.type == "g7" ? _showScoreDialog() :
              // widget.type == "p9" ? _showScoreDialog2() : widget.type == "wsas"  ? _showScoreDialog3()
              //     : _showScoreDialog4());
              } else {
                //next question
                setState(() {
                  selectedAnswer = null;
                  currentQuestionIndex++;
                });
              }
            },
            child: SvgPicture.asset(
                "assets/images/nextbutton.svg"
            ),
          )
        ],




      ),
    );
  }

  _showScoreDialog() {
    String howsevere = "";
    String title = "";
    if (score  < 5) {
       title = "According to GAD-7 assessment you don't have anxiety disorder";
      howsevere = "normal";
    }
    else if(score >= 5 && score < 10 )
      {
        title = "According to GAD-7 assessment you have mild Anxiety disorder";
        howsevere = "mild";
      }
    else if(score >= 10 && score < 15 )
    {
      title = "According to GAD-7 assessment you have moderate Anxiety disorder";
      howsevere = "mod";
    }
    else
    {
      title = "According to GAD-7 assessment you have severe Anxiety disorder";
      howsevere = "severe";
    }


    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      title: Text(
        title,
        style: TextStyle(color: howsevere == "normal" ?
          Colors.green : howsevere == "mild" ? Colors.green : howsevere == "mod" ?
        Colors.yellow : Colors.redAccent),
      ),
      content: ElevatedButton(
        child: const Text("Restart"),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
  _showScoreDialog2() {
    String howsevere = "";
    String title = "";
    if (score  < 5) {
      title = "According to PHQ-9 assessment you don't have Depression";
      howsevere = "normal";
    }
    else if(score >= 5 && score < 10 )
    {
      title = "According to PHQ-9 assessment you have mild Depression";
      howsevere = "mild";
    }
    else if(score >= 10 && score < 15 )
    {
      title = "According to PHQ-9 assessment you have moderate Depression";
      howsevere = "mod";
    }
    else if(score >= 15 && score < 20 )
    {
      title = "According to PHQ-9 assessment you have moderate severe Depression";
      howsevere = "modsev";
    }
    else
    {
      title = "According to PHQ-9 assessment you have severe Depression";
      howsevere = "severe";
    }


    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      title: Text(
        title,
        style: TextStyle(color: howsevere == "normal" ?
        Colors.green : howsevere == "mild" ? Colors.green : howsevere == "mod" ?
        Colors.yellow : howsevere == "modsev" ? Colors.redAccent : Colors.redAccent),
      ),
      content: ElevatedButton(
        child: const Text("Restart"),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
  _showScoreDialog3() {
    String howsevere = "";
    String title = "";
    if (score  <= 7) {
      title = "WSAS assessment indicates minimal impairment";
      howsevere = "normal";
    }
    else if(score >= 8 && score <= 12 )
    {
      title = "WSAS assessment indicates mild impairment";
      howsevere = "mild";
    }
    else if(score >= 10 && score <= 16 )
    {
      title = "WSAS assessment indicates moderate impairment";
      howsevere = "mod";
    }
    else
      {
        title = "WSAS assessment indicates severe impairment";
        howsevere = "severe";
      }


    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      title: Text(
        title,
        style: TextStyle(color: howsevere == "normal" ?
        Colors.green : howsevere == "mild" ? Colors.green : howsevere == "mod" ?
        Colors.yellow : Colors.redAccent),
      ),
      content: ElevatedButton(
        child: const Text("Restart"),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
  _showScoreDialog4() {
    String howsevere = "";
    String title = "";
    if (score  < 5) {
      title = "According to GAD-7 and PHQ-9 assessment you don't have anxiety disorder and depression";
      howsevere = "normal";
    }
    else if(score >= 5 && score < 10 )
    {
      title = "According to GAD-7 and PHQ-9 assessment you have mild Anxiety disorder and depression";
      howsevere = "mild";
    }
    else if(score >= 10 && score < 15 )
    {
      title = "According to GAD-7 and PHQ-9 assessment you have moderate Anxiety disorder and depression";
      howsevere = "mod";
    }
    else
    {
      title = "According to GAD-7 and PHQ-9 assessment you have severe Anxiety disorder and depression";
      howsevere = "severe";
    }


    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      title: Text(
        title,
        style: TextStyle(color: howsevere == "normal" ?
        Colors.green : howsevere == "mild" ? Colors.green : howsevere == "mod" ?
        Colors.yellow : Colors.redAccent),
      ),
      content: ElevatedButton(
        child: const Text("Restart"),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
}
