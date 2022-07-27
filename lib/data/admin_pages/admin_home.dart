import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[300],
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.favorite_rounded),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          // Scrollable Row for Hospitals
          SingleChildScrollView(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    children: [
                      Image.asset("assests/hospital1.png"),
                      Container(
                        child: Center(
                          child: Text('Hospital1'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
