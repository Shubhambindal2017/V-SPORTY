import 'package:flutter/material.dart';
import 'package:vsporty/loginpage.dart';
import 'package:vsporty/signup_page.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'Welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to V-Sporty'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'V-Sporty',
              style: TextStyle(fontSize: 60.0),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          Center(
            child: RaisedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
          ),
          SizedBox(
            height: 17.0,
          ),
          Center(
            child: RaisedButton(
              child: Text('Sign Up'),
              onPressed: () {
                Navigator.pushNamed(context, SignUpScreen.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
