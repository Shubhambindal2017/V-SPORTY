import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Winner extends StatefulWidget {
  static const id = "winner";
  String sport;
  Winner({this.sport});
  @override
  _WinnerState createState() => _WinnerState();
}

class _WinnerState extends State<Winner> {
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
                if (d.data['winner']) {
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Winner",
                              style: TextStyle(fontSize: 30.0),
                            ),
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
                              style: TextStyle(fontSize: 19.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  teams.add(
                    GestureDetector(
                      onTap: () async {
                        final team = await _firestore
                            .collection('userdetails')
                            .where('id', isEqualTo: d.data['id'])
                            .where('leader', isEqualTo: d.data['leader'])
                            .where('team', isEqualTo: d.data['team'])
                            .getDocuments();
                        final event = await _firestore
                            .collection('events')
                            .where('name', isEqualTo: d.data['sport'])
                            .where('over', isEqualTo: false)
                            .getDocuments();
                        final update = await _firestore
                            .collection('userdetails')
                            .document(team.documents[0].documentID)
                            .updateData(
                          {'winner': true},
                        );
                        final over = await _firestore
                            .collection('events')
                            .document(event.documents[0].documentID)
                            .updateData(
                          {'over': true},
                        );
                      },
                      child: Padding(
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
                              style: TextStyle(fontSize: 19.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
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
