import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'teamdata.dart';

class RegisteredTeamScreen extends StatefulWidget {
  static const id = "Registeaedteam";
  @override
  _RegisteredTeamScreenState createState() => _RegisteredTeamScreenState();
}

class _RegisteredTeamScreenState extends State<RegisteredTeamScreen> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sports"),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore.collection('events').snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data.documents;
            List<Widget> teams = List();
            int i = 0;
            for (var d in data) {
              i++;
              teams.add(
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    child: Text(
                      "$i) " + d.data['name'] + "    " + d.data['date'],
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeamScreen(
                            sport: d.data['name'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: teams,
            );
          },
        ),
      ),
    );
  }
}
