import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_details.dart';

class RegisterScreen extends StatefulWidget {
  static const id = 'registerevent';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: _firestore.collection('events').snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data.documents;
            List<Widget> details = List();
            for (var d in data) {
              if (!d.data['over']) {
                print(d.data['name']);
                details.add(
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetails(
                              event: d.data['name'],
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              d.data['name'],
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              d.data['date'],
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              d.data['time'],
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }
            return Column(children: details);
          },
        ),
      ),
    );
  }
}
