import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';

class TeamScreen extends StatefulWidget {
  static const id = "Team screen";
  String sport = "";
  TeamScreen({this.sport});
  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sport),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore.collection('userdetails').snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data.documents;
            List<Widget> teams = List();
            for (var d in data) {
              if (d.data['sport'].compareTo(widget.sport) == 0) {
                teams.add(
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          d.data['team'] +
                              ":    " +
                              d.data['leader'] +
                              "(" +
                              d.data['id'] +
                              ")",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          d.data['contact number'],
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ],
                    ),
                  ),
                );
              }
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
