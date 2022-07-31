import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curare/data/admin_pages/constants.dart';
import 'package:curare/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';

import '../models/hospital_model.dart';
import 'admin_home.dart';

class HospitalDetails extends StatefulWidget {
  const HospitalDetails({Key? key}) : super(key: key);

  @override
  State<HospitalDetails> createState() => _HospitalDetailsState();
}

class _HospitalDetailsState extends State<HospitalDetails> {
  final _departmentController = TextEditingController();
  final _doctorController = TextEditingController();
  final _timeSlotController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const AdminHome(),
              ),
            );
          },
          icon: Icon(FontAwesome.left_big),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              // Hospital Tiles
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 100,
                  // padding: const EdgeInsets.all(20),
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
                            'Hospital',
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
              const SizedBox(
                height: 20,
              ),
              // Department Text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Departments',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // TextField for adding Departments
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _departmentController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Department',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Add button for dept
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Add Department',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        final depart = Hospital(
                          dept: _departmentController.text,
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Available Departments

              const SizedBox(
                height: 10,
              ),

              // Department Tile
              DepartmentTile(),

              const SizedBox(
                height: 30,
              ),
              // Doctors
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Doctors',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // TextField for adding Doctors
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _doctorController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Doctor',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // TextField for adding Time Slot
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _timeSlotController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Time Slot',
                    fillColor: Colors.grey[300],
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Add Details',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        final docDetails = Hospital(
                          doc: _doctorController.text,
                          timeSlot: _timeSlotController.text,
                        );

                        addDocDetails(docDetails);
                      },
                      child: Container(
                        height: 40,
                        width: 60,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // // Available Departments
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Available Doctors',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              //Available Doctors and timeslot tiles
              const Mybox(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future addDocDetails(Hospital docDetails) async {
    final hosptialDoc = FirebaseFirestore.instance.collection('Hospital').doc();
    docDetails.id = hosptialDoc.id;

    final json = docDetails.toJson();
    await hosptialDoc.set(json);
  }

  Future addDeptDetails(Hospital depart) async {
    final hosptialDoc = FirebaseFirestore.instance.collection('Hospital').doc();
    depart.id = hosptialDoc.id;

    final json = depart.toJson();
    await hosptialDoc.set(json);
  }
}
