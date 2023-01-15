import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'events_page.dart';
import 'package:provider/provider.dart';
import 'google_sign_in.dart';

class LoggedInWidget extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  static String id = "LoggedInPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logged In"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blue[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profile",
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            Text(
              user.displayName!,
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              user.email!,
              style: TextStyle(fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
}
