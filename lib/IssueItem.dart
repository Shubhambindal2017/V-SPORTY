import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vsporty/dashboard.dart';

class IssueScreen extends StatelessWidget {
  static const id = "issuescrren";
  String sport;
  int qty;
  String _name;
  String _id;
  String _contact;
  final _firestore = Firestore.instance;

  IssueScreen({this.sport, this.qty});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Issue'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: sport),
            enabled: false,
          ),
          TextField(
            onChanged: (val) {
              _id = val;
            },
            decoration: InputDecoration(hintText: 'Id'),
          ),
          TextField(
            onChanged: (val) {
              _name = val;
            },
            decoration: InputDecoration(hintText: 'Name'),
          ),
          TextField(
            onChanged: (val) {
              _contact = val;
            },
            decoration: InputDecoration(hintText: 'Contact'),
          ),
          RaisedButton(
            color: Colors.black,
            textColor: Colors.white,
            child: Text('Submit'),
            onPressed: () async {
              qty--;
              final check = await _firestore.collection('issuedequip').add(
                {
                  'name': _name,
                  'id': _id,
                  'contact': _contact,
                  'equipment': sport,
                  'returned': false
                },
              );
              final val = await _firestore
                  .collection('equipment')
                  .where('name', isEqualTo: sport)
                  .getDocuments();
              //print(val.documents[0].documentID);

              final data = await _firestore
                  .collection('equipment')
                  .document(val.documents[0].documentID)
                  .updateData({'qty': qty.toString()});

              //Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
