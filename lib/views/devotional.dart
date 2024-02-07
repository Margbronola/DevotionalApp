// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devotionalapp/global/container.dart';
import 'package:devotionalapp/views/info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DevotionalPage extends StatefulWidget {
  const DevotionalPage({super.key});

  @override
  State<DevotionalPage> createState() => _DevotionalPageState();
}

class _DevotionalPageState extends State<DevotionalPage> {
  @override
  Widget build(BuildContext context) {
    CollectionReference students =
        FirebaseFirestore.instance.collection('devotional');

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 83, 48, 144),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InfoPage(
                        onUpdateCallback: (callback) {
                          setState(() {
                            fontSize = callback.bodySize;
                            titleSize = callback.bodySize;
                          });
                        },
                      )),
            );
          },
          icon: const Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              DateFormat("EEEE").format(DateTime.now()),
              style: TextStyle(color: const Color.fromARGB(255, 251, 193, 59)),
            ),
            Text(
              DateFormat("MMMM dd, yyyy").format(DateTime.now()),
              style: TextStyle(color: const Color.fromARGB(255, 252, 218, 70)),
            )
          ],
        ),
        titleTextStyle: const TextStyle(fontSize: 12, color: Colors.white),
      ),
      body: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<DocumentSnapshot>(
            //Fetching data from the documentId specified of the student
            future: students
                .doc("vG6WyGXPwAUYuTRFkV7p")
                .collection(DateFormat("MM-dd").format(DateTime.now()))
                .doc(DateFormat("MM-dd").format(DateTime.now()))
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
              if (snapshot.hasError) {
                print("${snapshot.error}");
                return const Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return const Text("Document does not exist");
              }

              //Data is output to the user
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;

                return ListView(
                  children: [
                    Text(
                      "${data['title']}",
                      style: TextStyle(
                          fontSize: titleSize,
                          color: const Color.fromARGB(255, 255, 90, 0),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text("${data['scripture']}",
                        style: TextStyle(fontSize: fontSize)),
                    const SizedBox(height: 10),
                    Text("${data['body']}",
                        style: TextStyle(fontSize: fontSize)),
                    const SizedBox(height: 20),
                  ],
                );
              }
              return const Text("loading");
            },
          )),
    );
  }
}
