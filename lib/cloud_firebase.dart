import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'logged_in_widget.dart';
import 'sign_up_widget.dart';
import 'events_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudPage extends StatelessWidget {
  static String id = "CloudPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('firestore'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("events").snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return Text("Loading pls wait");

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(snapshot.data.docs[0]["org"]),
              Text(snapshot.data.docs[0]["venue"].toString()),
              Text(snapshot.data.docs[0]["time"].toString()),
              Text(snapshot.data.docs[0]["date"].toString()),
            ],
          );
        },
      ),
    );
  }
}
