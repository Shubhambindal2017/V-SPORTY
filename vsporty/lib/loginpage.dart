import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vsporty/dashboard.dart';
import 'user_screen.dart';

class LoginScreen extends StatefulWidget {
  static const id = "login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _firestore = Firestore.instance;
  String _email;
  String _pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            onChanged: (val) {
              _email = val;
            },
            decoration: InputDecoration(hintText: 'Email'),
          ),
          TextField(
            onChanged: (val) {
              _pass = val;
            },
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          RaisedButton(
            color: Colors.black,
            textColor: Colors.white,
            child: Text('LogIn'),
            onPressed: () async {
              final Check = await _firestore
                  .collection('admin')
                  .where('email', isEqualTo: _email)
                  .where('password', isEqualTo: _pass)
                  .getDocuments();
              if (Check.documents.isEmpty) {
                final Check1 = await _firestore
                    .collection('user')
                    .where('email', isEqualTo: _email)
                    .where('password', isEqualTo: _pass)
                    .getDocuments();
                if (Check1.documents.isEmpty) {
                  print('Invalid Email or password');
                } else {
                  //Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard1(),
                    ),
                  );
                }
              } else {
                //Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
