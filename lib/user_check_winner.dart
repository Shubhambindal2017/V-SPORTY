import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_winner.dart';

class CheckWinner1 extends StatefulWidget {
  static const id = 'checkWineruser';
  @override
  _CheckWinner1State createState() => _CheckWinner1State();
}

class _CheckWinner1State extends State<CheckWinner1> {
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
                          builder: (context) => Winner1(
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
