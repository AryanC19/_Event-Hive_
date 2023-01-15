import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'logged_in_widget.dart';
import 'sign_up_widget.dart';
import 'events_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'google_sign_in.dart';
import 'cloud_firebase.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomePage.id,
          routes: {
            HomePage.id: (context) => HomePage(),
            SignUpWidget.id: (context) => SignUpWidget(),
            LoggedInWidget.id: (context) => LoggedInWidget(),
            CloudPage.id: (context) => CloudPage(),
          },
        ),
      );
}
