import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vsporty/add_admin.dart';
import 'package:vsporty/checkwinner.dart';
import 'package:vsporty/create_event.dart';
import 'package:vsporty/profile_page.dart';
import 'package:vsporty/register_event.dart';
import 'package:vsporty/registered_team.dart';
import 'avaliable_equipment.dart';
import 'Check_items.dart';
import 'registered_team.dart';

class Dashboard extends StatefulWidget {
  static const id = 'dashboard';
  final FirebaseUser user;
  Dashboard({Key key, @required this.user}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              child: Text('Create Event'),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, CreateEvent.id);
              },
            ),
            RaisedButton(
              color: Colors.black,
              child: Text('Add Admin'),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, AdminScreen.id);
              },
            ),
            RaisedButton(
              child: Text('Return Equipments'),
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, CheckItems.id);
              },
            ),
            RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Register Event'),
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
            ),
            RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Issue Equipments'),
              onPressed: () {
                Navigator.pushNamed(context, ItemScreen.id);
              },
            ),
            RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Registered Team'),
              onPressed: () {
                Navigator.pushNamed(context, RegisteredTeamScreen.id);
              },
            ),
            RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Update Result'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, CheckWinner.id);
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
                Navigator.pushNamed(context, ProfilePage.id);
              },
            ),
          ),
        ],
      ),
    );
  }
}
