import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vsporty/IssueItem.dart';
import 'package:vsporty/Registerevent_user.dart';
import 'package:vsporty/checkwinner.dart';
import 'package:vsporty/issueScreen_user.dart';
import 'package:vsporty/loginpage.dart';
import 'package:vsporty/register_event.dart';
import 'package:vsporty/registered_team.dart';
import 'package:vsporty/signup_page.dart';
import 'package:vsporty/teamdata.dart';
import 'package:vsporty/user_screen.dart';
import 'package:vsporty/user_winner.dart';
import 'package:vsporty/welcomepage.dart';
import 'profile_page.dart';
import 'package:vsporty/dashboard.dart';
import 'create_event.dart';
import 'add_admin.dart';
import 'register_event.dart';
import 'user_details.dart';
import 'avaliable_equipment.dart';
import 'Check_items.dart';
import 'selectWinner.dart';
import 'package:vsporty/user_check_winner.dart';
import 'userdetailspart2.dart';
import 'user_itemscreen.dart';
import 'profile_user.dart';

void main() => runApp(
      MaterialApp(
        home: WelcomeScreen(),
        routes: {
          ProfilePage1.id: (context) => ProfilePage1(),
          ItemScreen1.id: (context) => ItemScreen1(),
          IssueScreen1.id: (context) => IssueScreen1(),
          IssueScreen.id: (context) => IssueScreen(),
          RegisterScreen1.id: (context) => RegisterScreen1(),
          UserDetails1.id: (context) => UserDetails1(),
          Winner1.id: (context) => Winner1(),
          CheckWinner1.id: (context) => CheckWinner1(),
          Dashboard1.id: (context) => Dashboard1(),
          Winner.id: (context) => Winner(),
          CheckWinner.id: (context) => CheckWinner(),
          TeamScreen.id: (context) => TeamScreen(),
          RegisteredTeamScreen.id: (context) => RegisteredTeamScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          CheckItems.id: (context) => CheckItems(),
          ItemScreen.id: (context) => ItemScreen(),
          UserDetails.id: (context) => UserDetails(),
          RegisterScreen.id: (context) => RegisterScreen(),
          AdminScreen.id: (context) => AdminScreen(),
          CreateEvent.id: (context) => CreateEvent(),
          Home.id: (context) => Home(),
          ProfilePage.id: (context) => ProfilePage(),
          Dashboard.id: (context) => Dashboard(),
        },
      ),
    );

class Home extends StatefulWidget {
  static const id = 'Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
