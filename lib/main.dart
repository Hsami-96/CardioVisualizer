import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home:MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final titleText = Text(
          'Cardio Visualizer',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 30.0,
            color: Colors.red,
            letterSpacing: 1.0,
          ),
    );
    final signInBtn = FlatButton(
            color: Colors.red,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.redAccent[300],
            onPressed: () {
              /*...*/
            },
            child: Text(
              "Sign in with Google+",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
      );
    return Scaffold(
      body: Center(
        child:
          Stack(
          //child: new Column(
            children: <Widget> [
              new Container(
                child: titleText,
                //alignment: Alignment,
                 //alignment: FractionalOffset(0.1, -1.5),
                alignment: Alignment(0.1, -0.5),
              ),
              new Container(
                child: signInBtn,
                alignment: Alignment(0.01, 0.0)
              ),
            ]
          )
    ));
  }
}


