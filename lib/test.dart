import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

class quiz extends StatefulWidget {
  @override
  _quizState createState() => _quizState();
}

class _quizState extends State<quiz> {
  int index = 0;
  List questionbank = [
    Question.name(
        "The ratio of width of our National flag to its length is 2:3", true),
    Question.name(
        "Natya - Shastra the main source of India's classical dances was written by Bharat Muni",
        true),
    Question.name(
        "The words 'Satyameva Jayate' inscribed below the base plate of the emblem of India are taken from Rigveda",
        false),
    Question.name(
        "The Rath Yatra at Puri is celebrated in honour of Jaganath", true),
    Question.name("The book of Parsis is Torah", false),
    Question.name("The National Anthem was first sung in the year 1911", true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Center(
                  child: Image.asset(
                "images/download.jpeg",
                width: 200,
                height: 200,
              )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid,
                      )),
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10.0),
                    child: Text(
                      questionbank[index].questiont,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        width: 50,    
                        child: RaisedButton(
                        onPressed: () => prevQuestion(),
                        color: Colors.deepOrange[300],
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => checkAnswer(true, context),
                      color: Colors.white,
                      child: Text(
                        "True",
                        style: TextStyle(color: Colors.indigo),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => checkAnswer(false, context),
                      color: Colors.indigo,
                      child: Text(
                        "False",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                        child: RaisedButton(
                        onPressed: () => nextQuestion(),
                        color: Colors.green[300],
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionbank[index].iscorrect) {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text("Correct :) "),
        backgroundColor: Colors.green[400],
      );
      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text("Incorrect!!! :("),
        backgroundColor: Colors.red[400],
      );
      Scaffold.of(context).showSnackBar(snackbar);
      debugPrint("Incorrect :(");
    }
    nextQuestion();
  }

  nextQuestion() {
    setState(() {
      index = (index + 1) % questionbank.length;
    });
  }

  prevQuestion() {
    setState(() {
      if (index == 0) {
      } else {
        index = (index - 1) % questionbank.length;
      }
    });
  }
}
