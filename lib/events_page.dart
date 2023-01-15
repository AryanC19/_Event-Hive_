import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_up_widget.dart';
import 'package:provider/provider.dart';
import 'google_sign_in.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  static String id = "HomePage";

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bghero.png"),
              fit: BoxFit.cover,
            ),
          ),
          height: double.infinity,
          width: double.infinity,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const Text(
                "Event Hive",
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "Poppins",
                  color: const Color(0xFFEFEAE2),
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Navigator.pushNamed(context, SignUpWidget.id);
                },
              ),
              actions: [],
              // backgroundColor: Colors.green,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/bghero.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              bottom: const TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 4,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                    child: Text(
                      "Events",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: const Color(0xFFEFEAE2),
                      ),
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.school),
                    child: Text(
                      "Study",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: const Color(0xFFEFEAE2),
                      ),
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.event),
                    child: Text(
                      "Lectures",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: const Color(0xFFEFEAE2),
                      ),
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: const Color(0xFFEFEAE2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ListView(
                  children: [
                    // CollectionReference _referenceShoppingList =FirebaseFirestore.instance.collection("events");
                    buildCard(0),
                    buildCard(1),
                    buildCard(2),
                    buildCard(0),
                    buildCard(3),
                  ],
                ),
                ListView(
                  children: [
                    buildCard(0),
                    buildCard(1),
                    buildCard(2),
                    buildCard(0),
                    buildCard(3),
                  ],
                ),
                ListView(
                  children: [
                    Column(),
                    buildCard(0),
                    buildCard(1),
                    buildCard(2),
                    buildCard(0),
                    buildCard(3),
                  ],
                ),
                ListView(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Profile",
                            style:
                                TextStyle(fontSize: 35, fontFamily: "Poppins"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("images/ggpfp.jpg"),
                            // backgroundImage: NetworkImage(user.photoURL!),
                          ),
                          Text(
                            "Aryan",
                            style:
                                TextStyle(fontSize: 35, fontFamily: "Poppins"),
                          ),
                          Text(
                            "aryanchaudhary1900@gmail.com",
                            style:
                                TextStyle(fontSize: 15, fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildCard(int i) => Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage("images/bghero.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.transparent,
            child: ExpandablePanel(
              header: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "VIT",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Color(0xFFEFEAE2),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              collapsed: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("events")
                          .snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) return Text("Loading pls wait");

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              snapshot.data.docs[i]["org"],
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                color: const Color(0xFFEFEAE2),
                              ),
                            ),
                            Text(
                              snapshot.data.docs[i]["venue"].toString(),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                color: const Color(0xFFEFEAE2),
                              ),
                            ),
                            Text(
                              snapshot.data.docs[i]["time"].toString(),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                color: const Color(0xFFEFEAE2),
                              ),
                            ),
                            Text(
                              snapshot.data.docs[i]["date"].toString(),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                color: const Color(0xFFEFEAE2),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              expanded: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 5),
                        borderRadius: BorderRadius.circular(12), //<-- SEE HERE
                      ),
                      child: Image.asset('images/poster.png'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Poppins",
                          color: const Color(0xFFEFEAE2),
                        ),
                        "A fun 36 hour long hackathon conducted by Vinnovate IT",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
