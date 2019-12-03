import 'package:flutter/material.dart';
import 'user_screen.dart';
import 'package:vsporty/loginpage.dart';
import 'package:vsporty/welcomepage.dart';
import 'main.dart';

class ProfilePage1 extends StatelessWidget {
  static const id = 'profilepage11';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.supervised_user_circle,
              size: 150.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Email : Harsh Joshi",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text('Dashboard'),
              onPressed: () {
                //Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dashboard1(),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text('Profile'),
            ),
          ),
        ],
      ),
    );
  }
}
