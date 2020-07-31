import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'quizz_engine.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  static const Icon right = Icon(
    Icons.check,
    color: Colors.green,
  );

  static const Icon wrong = Icon(
    Icons.close,
    color: Colors.red,
  );

  QuizzEngine quizzEngine = QuizzEngine();
  Question currQuestion;

  _QuizPageState() {
    currQuestion = quizzEngine.getNextQuestion();
  }

  List<Icon> scoreKeeper = [];

  void checkQuestion(bool answer) {
    bool isCorrect = quizzEngine.checkAnswer(answer);
    setState(() {
      scoreKeeper.add(isCorrect ? right : wrong);
      if (!quizzEngine.hasNextQuestion()) {
        int score = quizzEngine.getScore();
        Alert(
          context: context,
          type: AlertType.none,
          style: AlertStyle(
            isCloseButton: false,
            isOverlayTapDismiss: false,
          ),
          title: "Terminou!",
          desc: "Sua nota foi $score.",
          buttons: [
            DialogButton(
              child: Text(
                "Reiniciar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Colors.blue,
              radius: BorderRadius.circular(0.0),
            ),
          ],
        ).show();
        quizzEngine.reset();
        scoreKeeper.clear();
      }
      currQuestion = quizzEngine.getNextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    currQuestion.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ] +
          currQuestion.answers
              .map((a) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text(
                          a.text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () => checkQuestion(a.isCorrect),
                      ),
                    ),
                  ))
              .toList(growable: false) +
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: scoreKeeper,
            ),
          ],
    );
  }
}
