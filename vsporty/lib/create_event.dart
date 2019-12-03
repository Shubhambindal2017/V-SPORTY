import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateEvent extends StatelessWidget {
  static const id = 'create Event';
  final _firestore = Firestore.instance;
  String _name;
  String _date;
  String _time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'Event Name'),
            keyboardType: TextInputType.text,
            onChanged: (val) {
              _name = val;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Date'),
            keyboardType: TextInputType.text,
            onChanged: (val) {
              _date = val;
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Time'),
            keyboardType: TextInputType.text,
            onChanged: (val) {
              _time = val;
            },
          ),
          RaisedButton(
            child: Text('Create'),
            color: Colors.black,
            textColor: Colors.white,
            onPressed: () async {
              final check = await _firestore
                  .collection('events')
                  .where('name', isEqualTo: _name)
                  .where('date', isEqualTo: _date)
                  .where('time', isEqualTo: _time)
                  .getDocuments();
              if (check.documents.isEmpty) {
                final data = await _firestore.collection('events').add(
                  {
                    'name': _name,
                    'date': _date,
                    'time': _time,
                    'over': false,
                  },
                );
              }

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
