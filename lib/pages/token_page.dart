import 'package:flutter/material.dart';

import 'package:curare/pages/uhome.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Booking Summary')),
        backgroundColor: Colors.white,
        body: MyCardWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyCardWidget extends StatelessWidget {
  const MyCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 450,
      padding: new EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color.fromARGB(255, 239, 106, 4),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Digital Token",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  " Patient Name",
                  style: TextStyle(
                    fontSize: 14.0, color: Color.fromARGB(255, 255, 255, 255),

                    //letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "Ann Babu",
                  style: TextStyle(
                    fontSize: 18.0, color: Colors.black,
                    // letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "Age",
                  style: TextStyle(
                    fontSize: 14.0, color: Color.fromARGB(255, 255, 255, 255),

                    //letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "21",
                  style: TextStyle(
                    fontSize: 18.0, color: Colors.black,
                    // letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "Gender",
                  style: TextStyle(
                    fontSize: 14.0, color: Color.fromARGB(255, 255, 255, 255),

                    //letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "Female",
                  style: TextStyle(
                    fontSize: 18.0, color: Colors.black,
                    // letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "Doctor",
                  style: TextStyle(
                    fontSize: 14.0, color: Color.fromARGB(255, 255, 255, 255),

                    //letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "Dr . Anu Nair",
                  style: TextStyle(
                    fontSize: 18.0, color: Colors.black,
                    // letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "Hospital",
                  style: TextStyle(
                    fontSize: 14.0, color: Color.fromARGB(255, 255, 255, 255),

                    //letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "Kalaketty PHC",
                  style: TextStyle(
                    fontSize: 18.0, color: Colors.black,
                    // letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "Token Number",
                  style: TextStyle(
                    fontSize: 14.0, color: Color.fromARGB(255, 250, 250, 250),

                    //letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "3",
                  style: TextStyle(
                    fontSize: 18.0, color: Colors.black,
                    // letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "Time Slot",
                  style: TextStyle(
                    fontSize: 14.0, color: Color.fromARGB(255, 255, 255, 255),

                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text(
                  "10:30 -12:00",
                  style: TextStyle(
                    fontSize: 18.0, color: Colors.black,
                    // letterSpacing: 2.0,
                    //fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Home'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 193, 51, 0),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Mypage1()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
