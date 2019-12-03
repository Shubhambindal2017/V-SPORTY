import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Winner1 extends StatefulWidget {
  static const id = "winner";
  String sport;
  Winner1({this.sport});
  @override
  _Winner1State createState() => _Winner1State();
}

class _Winner1State extends State<Winner1> {
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
