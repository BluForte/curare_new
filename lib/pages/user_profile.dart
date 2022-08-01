import 'package:curare/data/models/userp_Model.dart';
import 'package:curare/data/models/userprofile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UP extends StatefulWidget {
  const UP({Key? key}) : super(key: key);

  @override
  State<UP> createState() => _UPState();
}

class _UPState extends State<UP> {
  @override
  Widget build(BuildContext context) {
    UserModels u1 = Provider.of<UserpageDetailsProvider>(context).userpage;

    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        backgroundColor: const Color.fromARGB(255, 106, 255, 243),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Image.asset(
                          'lib/assets/alien.png',
                          scale: 6,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: const Text(
                                "Name",
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(width: 200),
                          Text(u1.name),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: const Text(
                                "Email",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(width: 140),
                          Text(u1.mail),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: const Text("Age",
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ),
                          const SizedBox(width: 240),
                          Text(u1.age),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: const Text(
                                "Number",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(width: 180),
                          Text(u1.no),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              child: const Text(
                                "Sex",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(width: 240),
                          Text(u1.sex),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
