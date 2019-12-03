import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'selectWinner.dart';

class CheckWinner extends StatefulWidget {
  static const id = 'checkWiner';
  @override
  _CheckWinnerState createState() => _CheckWinnerState();
}

class _CheckWinnerState extends State<CheckWinner> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teams"),
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
                      "$i) " + d.data['name'],
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Winner(
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
