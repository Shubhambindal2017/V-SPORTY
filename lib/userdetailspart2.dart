import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vsporty/user_screen.dart';

class UserDetails1 extends StatelessWidget {
  static const id = 'userdetails21';
  final _firestore = Firestore.instance;
  String event;
  String _id;
  String _team;
  String _leader;
  String _contact;
  UserDetails1({this.event});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            enabled: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: event),
          ),
          TextField(
            onChanged: (val) {
              _id = val;
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Id'),
          ),
          TextField(
            onChanged: (val) {
              _leader = val;
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Leader'),
          ),
          TextField(
            onChanged: (val) {
              _team = val;
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Team'),
          ),
          TextField(
            onChanged: (val) {
              _contact = val;
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: 'Contact Number'),
          ),
          RaisedButton(
            color: Colors.black,
            textColor: Colors.white,
            child: Text('Submit'),
            onPressed: () async {
              final check = await _firestore
                  .collection('userdetails')
                  .where('team', isEqualTo: _team)
                  .getDocuments();
              if (check.documents.isEmpty) {
                final data = await _firestore.collection('userdetails').add(
                  {
                    'contact number': _contact,
                    'id': _id,
                    'leader': _leader,
                    'sport': event,
                    'team': _team,
                    'winner': false,
                  },
                );
              }
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pushNamed(context, Dashboard1.id);
            },
          ),
        ],
      ),
    );
  }
}
