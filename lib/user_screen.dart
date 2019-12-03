import 'package:flutter/material.dart';
import 'package:vsporty/profile_page.dart';
import 'package:vsporty/Registerevent_user.dart';
import 'package:vsporty/profile_user.dart';
import 'package:vsporty/user_itemscreen.dart';
import 'avaliable_equipment.dart';
import 'user_check_winner.dart';

class Dashboard1 extends StatefulWidget {
  static const id = "userScreen";
  @override
  _Dashboard1State createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Register Event'),
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen1.id);
              },
            ),
            RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Issue Equipments'),
              onPressed: () {
                Navigator.pushNamed(context, ItemScreen1.id);
              },
            ),
            RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Result'),
              onPressed: () {
                Navigator.pushNamed(context, CheckWinner1.id);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text('Dashboard'),
            ),
          ),
          Expanded(
            child: RaisedButton(
              child: Text('Profile'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, ProfilePage1.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
