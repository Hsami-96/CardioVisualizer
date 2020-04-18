import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn(); 
  
    Future<String> signInWithGoogle() async {
      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
    );

      final AuthResult authResult = await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);

      return 'signInWithGoogle succeeded: $user';
  }

  void signOutGoogle() async{
    await googleSignIn.signOut();

    print("User Sign Out");
  }
  
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
              signInWithGoogle().whenComplete(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FirstScreen();
                },
              ),
            );
            });
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

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue[100]),
    );
  }
}


