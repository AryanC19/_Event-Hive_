import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'events_page.dart';
import 'package:provider/provider.dart';
import 'google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'events_page.dart';
import 'package:provider/provider.dart';
import 'google_sign_in.dart';

class SignUpWidget extends StatelessWidget {
  static String id = "LoginPage";

  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage("images/bghero.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 130,
            ),
            const Text(
              "Event Hive",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 60,
                color: const Color(0xFFEFEAE2),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Never miss another event due to a cluttered inbox",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter Name',
                  labelText: 'Name ',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: 'Enter Password',
                  labelText: 'Password',
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 100, right: 100, top: 20, bottom: 10),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEFEAE2),
                ),
                onPressed: () {
                  // final provider =
                  //     Provider.of<GoogleSignInProvider>(context, listen: false);
                  // provider.googleLogin();
                  // GoogleSignIn().signIn();

                  // Navigator.pushNamed(context, HomePage.id);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.blue,
                ),
                label: const Text(
                  "Sign in with google",
                  style: TextStyle(
                      color: Colors.black,
                      // color: const Color(0xFFEFEAE2),

                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 100, right: 100, top: 10, bottom: 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, HomePage.id);
                  },
                  child: Text("Already a User?  Sign In")),
            ),
          ],
        ),
      ),
    );
  }
}
