// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DR_Profile extends StatefulWidget {
  const DR_Profile({Key? key}) : super(key: key);

  @override
  State<DR_Profile> createState() => _DR_ProfileState();
}

class _DR_ProfileState extends State<DR_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              child: Container(
                alignment: Alignment(0.0, 2.5),
                child: const CircleAvatar(
                  backgroundColor: Color(0xFF6998AB),
                  //backgroundImage: AssetImage("assete/c3.JPG"),
                  radius: 70.0,
                  child: Icon(
                    Icons.person,
                    size: 80,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
              height: 30,
            ),
            Row(
              children: [
                Center(
                  child: Container(
                    height: 30,
                    width: 40,
                    child: Icon(Icons.person),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 12.0, color: Colors.blueGrey,
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
                          height: 20,
                        ),
                        Text(
                          "Dr . Anu ",
                          style: TextStyle(
                            fontSize: 22.0, color: Colors.black,
                            // letterSpacing: 2.0,
                            //fontWeight: FontWeight.w800
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Text(
                    "About the Doctor",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please write the description of the doctor here. This will be a detailed information about the doctor and the roles and achievements that the doctor has had over the past years",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Available Time Slots",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  timeSlotWidget(
                      "13", "MAY", "Consultation", "Sunday 9 am to 11.30 am"),
                  timeSlotWidget(
                      "14", "MAY", "Consultation", "Monday 10 am to 12.30 am"),
                  timeSlotWidget(
                      "1", "JUN", "Consultation", "Wednesday 8 am to 12.30 pm"),
                  timeSlotWidget(
                      "3", "JUN", "Consultation", "Friday 8 am to 1 am"),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: 290,
              height: 44,
              child: MaterialButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                color: Colors.blue,
                child: Text(
                  'go to payments',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  timeSlotWidget(String date, String month, String slotType, String time) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xFF6998AB)),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFF6998AB),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    date,
                    style: TextStyle(
                        color: Color(0xFF6998AB),
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    month,
                    style: TextStyle(
                        color: Color(0xFF6998AB),
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  slotType,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
