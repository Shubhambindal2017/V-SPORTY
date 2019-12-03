import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckItems extends StatefulWidget {
  static const id = 'checkItems';
  @override
  _CheckItemsState createState() => _CheckItemsState();
}

class _CheckItemsState extends State<CheckItems> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check'),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore.collection('issuedequip').snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data.documents;
            List<Widget> stock = List();
            for (var d in data) {
              if (!d.data['returned']) {
                stock.add(
                  GestureDetector(
                    onTap: () async {
                      final data = await _firestore
                          .collection('issuedequip')
                          .where('id', isEqualTo: d.data['id'])
                          .where('equipment', isEqualTo: d.data['equipment'])
                          .where('returned', isEqualTo: false)
                          .getDocuments();
                      final data1 = await _firestore
                          .collection('issuedequip')
                          .document(data.documents[0].documentID)
                          .updateData(
                        {'returned': true},
                      );
                      print(d.data['equipment']);
                      final item = await _firestore
                          .collection('equipment')
                          .where('name', isEqualTo: d.data['equipment'])
                          .getDocuments();
                      // print(item.documents);
                      int qty = int.parse(item.documents[0].data['qty']) + 1;
                      print(qty);
                      final item1 = await _firestore
                          .collection('equipment')
                          .document(item.documents[0].documentID)
                          .updateData({'qty': qty.toString()});
                    },
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            d.data['equipment'],
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            d.data['id'],
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            d.data['name'],
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
            return Column(
              children: stock,
            );
          },
        ),
      ),
    );
  }
}
