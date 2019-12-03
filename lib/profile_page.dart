import 'package:flutter/material.dart';
import 'package:vsporty/dashboard.dart';
import 'package:vsporty/loginpage.dart';
import 'package:vsporty/welcomepage.dart';
import 'main.dart';

class ProfilePage extends StatelessWidget {
  static const id = 'profilepage';
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
                    builder: (context) => Dashboard(),
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
