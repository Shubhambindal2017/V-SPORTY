import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vsporty/issueScreen_user.dart';

class ItemScreen1 extends StatefulWidget {
  static const id = 'itemscreen11';
  @override
  _ItemScreen1State createState() => _ItemScreen1State();
}

class _ItemScreen1State extends State<ItemScreen1> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avaliable Items'),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore.collection('equipment').snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data.documents;
            List<Widget> items = List();
            for (var d in data) {
              items.add(
                GestureDetector(
                  onTap: () {
                    if (d.data['qty'].compareTo('0') != 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IssueScreen1(
                            sport: d.data['name'],
                            qty: int.parse(d.data['qty']),
                          ),
                        ),
                      );
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Text(
                          d.data['name'],
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      Expanded(
                        child: Text(d.data['qty'],
                            style: TextStyle(fontSize: 25.0)),
                      )
                    ],
                  ),
                ),
              );
            }
            return Column(
              children: items,
            );
          },
        ),
      ),
    );
  }
}
