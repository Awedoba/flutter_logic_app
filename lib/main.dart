import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOgic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'LOgic'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var question = [
    'Welcome, use the nect and back bottom to move though the questions and show answer buttom to see the right answer. \n\n\n Tap next to start',
    '1. You are at a game show and there are three closed doors. There is a prize hidden behind one of the doors and the game show host knows where it is. You are asked to choose a door. The game show host then opens one of the other two doors showing that it is empty and asks you if you would like to change your selection. Should you stick to your original selection?',
    '2. You are in a race and you overtake the person who is in second place. What is your position now?',
    '3. Six drinking glasses stand in a row, with the first three full of juice and the next three empty. By moving only one glass can you arrange them so empty and full glasses alternate?',
    '4. A man is asked what his daughters look like. He answers, "They are all blondes, but two, all brunettes, but two, and all redheads, but two." How many daughters did he have?',
    '5. Why is it better to have round manhole covers than square ones?',
    '6. There is a waterlily in a pond, that doubles in size every day. If it takes the waterlily 180 days to cover the entire pond, how long does it take to cover half the pond?',
  ];
  var answer = [
    'hmmm. soooo ......',
    ' It is better if you select the other door. Since there are three doors then there is a 67% chance that you choose the wrong door with your first selection. If you are wrong the game show host will select the other wrong door since she knows where the prize is hidden. Therefore it is better if you switch to the door which the game show host leaves closed.',
    ' You are in second place since you overtook the second runner and took her place!',
    ' Pour the second glass into the fifth glass.',
    ' Three.. one blonde, one brunette and one redhead.',
    ' A round manhole cannot be dropped down the manhole. or Because manholes are round.',
    ' 179 days.',
  ];
  var showQA = 'Show  Answer';
  var questionNumber = 0;
  var answerNumber = 0;
  bool showAnswer = false;
  String show =
      'Welcome, use the next and back bottoms to move though the questions and show answer buttom to see the right answer. \n\n\n Tap next to start';

  move(var direction) {
    setState(() {
      direction == 1 ? questionNumber++ : questionNumber--;
      show = question[questionNumber];
    });
  }

  Answer() {
    setState(() {
      show = answer[questionNumber];
      showAnswer = true;
      showQA = 'Show  Question';
    });
  }

  Question() {
    setState(() {
      show = question[questionNumber];
      showAnswer = false;
      showQA = 'Show  Answer';
    });
  }

  visible() {
    if (questionNumber != 0) {
      return true;
    }
    return false;
  }

//check if at array end
  checkMove(var direction) {
    if (direction == 1) {
      if (questionNumber == 6) {
        return true;
      }
    } else if (direction == 0) {
      if (questionNumber == 0) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: Column(
                children: <Widget>[
//                  -------------------------------question-------------------------------------
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '$show',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ),
//                  -------------------------------show answer or question btn ---------------------
                  Visibility(
                    visible: visible(),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () => showAnswer ? Question() : Answer(),
                        child: Text(
                          '$showQA',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
//               --------------------------------movement--------------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
//                      moving back
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: IconButton(
//                              icon: Icon(Icons.arrow_back),
                              icon: Text(
                                'Back',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
//                              onPressed: () => move(0),
                              onPressed: () => checkMove(0) ? null : move(0),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
//                      moving forward
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: IconButton(
//                              icon: Icon(Icons.arrow_forward),
                              icon: Text(
                                'Next',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
//                              onPressed: () => move(1),
                              onPressed: () => checkMove(1) ? null : move(1),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
