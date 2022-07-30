import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curare/data/admin_pages/edit_hospital.dart';
import 'package:curare/data/remote_data_source/firestore_helper.dart';
import 'package:curare/data/admin_pages/hospital_page.dart';
import 'package:curare/data/admin_pages/tokens.dart';
import 'package:curare/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  // document_Id
  List<String> docsId = [];

  // get document_Id
  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('Hospitals')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {}));
  }

  @override
  void initState() {
    super.initState();
    _getdetailsFromFirestore();
  }

  _getdetailsFromFirestore() async {
    final user = await FirestoreHelper.readUser();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HospitalPage(),
                ),
              );
            },
            icon: Icon(FontAwesome.plus),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              height: 100,
              child: Row(
                // Navigation Containers
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TokensPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 90,
                      width: 90,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(15)),
                      child: const Center(
                        child: Text(
                          'tokens',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text(
                        'test',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      border: Border.all(color: Colors.white, width: 3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        'test',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Hospitals',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Hospital Tiles
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HospitalDetails(),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'lib/assets/vschedule.png',
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hospital Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                'Location',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
